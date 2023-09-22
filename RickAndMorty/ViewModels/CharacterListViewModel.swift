//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/09/23.
//

import UIKit

protocol CharacterListViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: Character)
}

/// ViewModel to handle character list view logic
final class CharacterListViewModel: NSObject {
    
    public weak var delegate: CharacterListViewModelDelegate?
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
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
    
    private var apiInfo: GetAllCharactersResponse.Info? = nil
    
    /// Fetch initial set of characters (20)
    public func fetchCharacters() {
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    /// Paginate if additional characters are needed
    public func fetchAdditionalCharacters() {
        // TODO: Fetch characters
    }
}

// MARK: - CollectionView

extension CharacterListViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier, for: indexPath) as? CharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter else { return UICollectionReusableView() }
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: FooterLoadingCollectionReusableView.identifier,
                                                                     for: indexPath)
        return footer
    }
}

extension CharacterListViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

// MARK: - ScrollView Delegate
extension CharacterListViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator else { return }
    }
}
