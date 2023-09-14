//
//  CharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 14/09/23.
//

import Foundation

final class CharacterCollectionViewCellViewModel {
    
    public let characterName: String
    private let characterStatus: CharacterStatus
    private let characterImageUrl: URL?
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
    // MARK: - Init
    init(characterName: String, characterStatus: CharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public func fectchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
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
