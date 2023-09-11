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
    
    enum ServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data error
    public func execute<T: Codable>(_ request: Request, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(ServiceError.failedToCreateRequest))
            return
        }
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: - Private
    
    private func request(from request: Request) -> URLRequest? {
        guard let url = request.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod
        return urlRequest
    }
}
