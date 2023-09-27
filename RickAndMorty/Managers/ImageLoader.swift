//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 27/09/23.
//

import Foundation

final class ImageLoader {
    static let shared = ImageLoader()
    private var imageDataCache = NSCache<NSString, NSData>()
    private init(){}
    
    /// Get Image With URL
    /// - Parameters:
    ///   - url: Source URL
    ///   - completion: Callback
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: key){
            completion(.success(data as Data))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data,
                  error == nil,
                  let self = self
            else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            let key = url.absoluteString as NSString
            self.imageDataCache.setObject(value, forKey: key)
            completion(.success(data))
        }.resume()
    }
}
