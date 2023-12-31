//
//  CharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 05/10/23.
//

import Foundation

final class CharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}
