//
//  Episode.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import Foundation

struct Episode: Codable, EpisodeDataRenderProtocol {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
