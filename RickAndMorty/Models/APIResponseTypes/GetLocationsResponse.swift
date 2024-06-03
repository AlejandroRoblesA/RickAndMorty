//
//  GetLocationsResponse.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 03/06/24.
//

import Foundation

struct GetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String
        let prev: String?
    }
    let info: Info
    let results: [Location]
}
