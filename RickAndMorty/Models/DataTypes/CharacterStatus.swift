//
//  CharacterStatus.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 07/09/23.
//

import Foundation

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        rawValue.capitalized
    }
}
