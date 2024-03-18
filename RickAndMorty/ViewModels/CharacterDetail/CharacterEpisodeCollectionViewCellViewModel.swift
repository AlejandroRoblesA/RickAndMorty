//
//  CharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 05/10/23.
//

import Foundation

final class CharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    private var isFetching: Bool = false
    //MARK: - Init
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
    
    public func fetchEpisode() {
        guard !isFetching else { return }
        guard
            let url = episodeDataUrl,
            let request = Request(url: url)
        else {
            return
        }
        isFetching = true
        Service.shared.execute(request, expecting: Episode.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success.id))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
