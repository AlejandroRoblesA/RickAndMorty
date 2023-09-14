//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/09/23.
//

import UIKit

final class CharacterListViewModel: NSObject {
   
    func fetchCharacters() {
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url:" + String(model.results.first?.image ?? "No image"))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension CharacterListViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
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
