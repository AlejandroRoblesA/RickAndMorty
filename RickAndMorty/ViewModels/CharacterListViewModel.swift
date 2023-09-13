//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/09/23.
//

import Foundation

struct CharacterListViewModel {
    func fetchCharacters() {
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
