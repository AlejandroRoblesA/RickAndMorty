//
//  Location.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import Foundation

struct Location: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
