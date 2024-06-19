//
//  LocationDetailViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 19/06/24.
//

import Foundation

protocol LocationDetailViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

final class LocationDetailViewModel {
    private let endpointUrl: URL?
    private var dataTuple: (location: Location, characters: [Character])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchLocationDetails()
        }
    }

    enum SectionType {
        case information(viewModels: [EpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [CharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: LocationDetailViewModelDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []
    
    // MARK: - Init
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    // MARK: - Private functions
    
    func createCellViewModels() {
        guard let dataTuple = dataTuple else { return }
        let location = dataTuple.location
        let characters = dataTuple.characters
        
        var dateFormatter = location.created
        if let date = CharacterInfoCollectionViewCellViewModel.dataFormatter.date(from: location.created) {
            dateFormatter = CharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date)
        }
        
        cellViewModels = [
            .information(viewModels: [
                .init(title: "Location Name", value: location.name),
                .init(title: "Air Date", value: location.type),
                .init(title: "Episode", value: location.dimension),
                .init(title: "Created", value: dateFormatter)
            ]),
            .characters(viewModel: characters.compactMap({ character in
                return CharacterCollectionViewCellViewModel(characterName: character.name,
                                                            characterStatus: character.status,
                                                            characterImageUrl: URL(string: character.image))
            }))
        ]
    }

    private func fetchRelatedCharacters(location: Location) {
        let requests: [Request] = location.residents.compactMap {
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
            self.dataTuple = (location: location, characters: characters)
        }
    }
    
    // MARK: - Public functions
    // Fetch Backing Location Model
    public func fetchLocationData() {
        guard
            let url = endpointUrl,
            let request = Request(url: url)
        else {
            return
        }
        
        Service.shared.execute(request, expecting: Location.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(location: model)
            case .failure:
                break
            }
        }
    }
    
    public func character(at index: Int) -> Character? {
        guard let dataTuple = dataTuple else { return nil }
        return dataTuple.characters[index]
        
    }
}
