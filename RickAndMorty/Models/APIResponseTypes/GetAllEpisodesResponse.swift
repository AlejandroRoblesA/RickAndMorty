//
//  GetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 25/03/24.
//

import Foundation

struct GetAllEpisodesResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String
        let prev: String?
    }
    let info: Info
    let results: [Episode]
}
