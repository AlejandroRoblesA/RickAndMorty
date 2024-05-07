//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 20/03/24.
//

import Foundation

protocol EpisodeDetailViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class EpisodeDetailViewModel {
    private let endpointUrl: URL?
    private var dataTuple: (Episode, [Character])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }

    enum SectionType {
        case information(viewModels: [EpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [CharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: EpisodeDetailViewModelDelegate?
    
    public private(set) var sections: [SectionType] = []
    
    // MARK: - Init
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    // MARK: - Private functions
    private func fetchRelatedCharacters(episode: Episode) {
        let requests: [Request] = episode.characters.compactMap {
            return URL(string: $0)
        }.compactMap {
            return Request(url: $0)
        }
        
        let group = DispatchGroup()
        var characters: [Character] = []
        for request in requests {
            group.enter()
            Service.shared.execute(request, expecting: Character.self) { result in
                defer {
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
            }
        }
        group.notify(queue: .main) {
            self.dataTuple = (episode, characters)
        }
    }
    
    // MARK: - Public functions
    // Fetch Backing Episode Model
    public func fetchEpisodeData() {
        guard
            let url = endpointUrl,
            let request = Request(url: url)
        else {
            return
        }
        
        Service.shared.execute(request, expecting: Episode.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure:
                break
            }
        }
    }
}
