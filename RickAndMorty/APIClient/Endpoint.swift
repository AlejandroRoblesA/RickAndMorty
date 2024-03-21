//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 29/08/23.
//

import Foundation

/// Represents unique API endpoints
@frozen enum Endpoint: String, CaseIterable, Hashable {
    /// Endpoint to get character information
    case character
    /// Endpoint to get location information
    case location
    /// Endpoint to get episode information
    case episode
}
