//
//  GetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 11/09/23.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String
        let prev: String?
    }
    let info: Info
    let results: [Character]
}
