//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/09/23.
//

import Foundation

final class CharacterDetailViewModel {
    private let character: Character
    
    enum SectionType: CaseIterable {
        case photo
        case information
        case episodes
    }
    
    public let sections = SectionType.allCases
    
    public var title: String {
        character.name.uppercased()
    }
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    // MARK: - Init
    
    init(character: Character) {
        self.character = character
    }
}
