//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/09/23.
//

import UIKit

final class CharacterListViewModel: NSObject {
    
    private var characters: [Character] = [] {
        didSet {
            for character in characters {
                let viewModel = CharacterCollectionViewCellViewModel(characterName: character.name,
                                                                     characterStatus: character.status,
                                                                     characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
        }
    }
    private var cellViewModels: [CharacterCollectionViewCellViewModel] = []
   
    public func fetchCharacters() {
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters = results
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension CharacterListViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier, for: indexPath) as? CharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = CharacterCollectionViewCellViewModel(characterName: "Alejandro", characterStatus: .alive, characterImageUrl: URL(string:"https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        cell.configure(with: viewModel)
        return cell
    }
}

extension CharacterListViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}
