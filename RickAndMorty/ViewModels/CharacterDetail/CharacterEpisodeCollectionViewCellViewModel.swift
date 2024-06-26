//
//  CharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 05/10/23.
//

import UIKit

protocol EpisodeDataRenderProtocol {
    var name: String { get }
    var air_date: String { get }
    var episode: String { get }
}

final class CharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    private var isFetching: Bool = false
    private var dataBlock: ((EpisodeDataRenderProtocol) -> Void)?
    private var episode: Episode? {
        didSet {
            guard let model = episode else { return }
            self.dataBlock?(model)
        }
    }
    public let borderColor: UIColor
    //MARK: - Init
    init(episodeDataUrl: URL?, borderColor: UIColor = .systemBlue) {
        self.episodeDataUrl = episodeDataUrl
        self.borderColor = borderColor
    }
    
    public func registerForData(_ block: @escaping (EpisodeDataRenderProtocol) -> Void) {
        self.dataBlock = block
    }
    
    public func fetchEpisode() {
        guard
            !isFetching
        else {
            if let model = episode {
                dataBlock?(model)
            }
            return
        }
        guard
            let url = episodeDataUrl,
            let request = Request(url: url)
        else {
            return
        }
        isFetching = true
        Service.shared.execute(request, expecting: Episode.self) { [weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.episode = model
                }
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}

extension CharacterEpisodeCollectionViewCellViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.episodeDataUrl?.absoluteString ?? String())
    }
}

extension CharacterEpisodeCollectionViewCellViewModel: Equatable {
    static func == (lhs: CharacterEpisodeCollectionViewCellViewModel, rhs: CharacterEpisodeCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
