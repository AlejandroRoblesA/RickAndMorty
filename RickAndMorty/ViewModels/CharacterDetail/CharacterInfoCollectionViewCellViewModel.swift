//
//  CharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 05/10/23.
//

import Foundation

final class CharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    init (value: String, title: String) {
        self.value = value
        self.title = title
    }
}
