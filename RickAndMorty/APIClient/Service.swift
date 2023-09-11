//
//  Services.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 29/08/23.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class Service {
    
    /// Shared singleton instance
    static let shared = Service()
    
    /// Private contructor
    private init() { }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data error
    public func execute<T: Codable>(_ request: Request, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
