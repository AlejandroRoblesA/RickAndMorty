//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/09/23.
//

import Foundation

final class CharacterDetailViewModel {
    private let character: Character
    init(character: Character) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}