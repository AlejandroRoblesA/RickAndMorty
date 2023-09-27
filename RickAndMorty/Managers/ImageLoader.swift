//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 27/09/23.
//

import Foundation

final class ImageLoader {
    static let shared = ImageLoader()
    private init(){}
    
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
