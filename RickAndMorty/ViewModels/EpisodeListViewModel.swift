//
//  EpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/03/24.
//

import Foundation

protocol EpisodeListViewModelDelegate: AnyObject {
    func didLoadInitialEpisodes()
    func didLoadMoreEpisodes(with newIndexPath: [IndexPath])
    func didSelectEpisodes(_ episode: Episode)
}

/// ViewModel to handle episode list view logic
final class EpisodeListViewModel: NSObject {
    
    public weak var delegate: EpisodeListViewModelDelegate?
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    private var isLoadingMoreCharacters = false
    private var episodes: [Episode] = [] {
        didSet {
            for episode in episodes {
//                let viewModel = EpisodeCollectionViewCellViewModel(characterName: episode.name,
//                                                                     characterStatus: episode.status,
//                                                                     characterImageUrl: URL(string: episode.image))
//                if !cellViewModels.contains(viewModel) {
//                    cellViewModels.append(viewModel)
//                }
            }
        }
    }
    private var cellViewModels: [CharacterEpisodeCollectionViewCellViewModel] = []
    
    private var apiInfo: GetAllCharactersResponse.Info? = nil
    
    /// Fetch initial set of characters (20)
    public func fetchCharacters() {
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
//                self?.episodes = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialEpisodes()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    /// Paginate if additional characters are needed
    public func fetchAdditionalCharacters(url: URL) {
        guard !isLoadingMoreCharacters else {
            return
        }
        isLoadingMoreCharacters = true
        guard let request = Request(url: url) else {
            isLoadingMoreCharacters = false
            return
        }
        Service.shared.execute(request, expecting: GetAllCharactersResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                self.apiInfo = info
                let originalCount = self.episodes.count
                let newCount = moreResults.count
                let total = originalCount + newCount
                let startingIndex = total - newCount
                let indexPathToAdd: [IndexPath] = Array(startingIndex..<(startingIndex+newCount)).compactMap({
                    return IndexPath(row: $0, section: 0)
                })
//                self.episodes.append(contentsOf: moreResults)
                DispatchQueue.main.async {
                    self.delegate?.didLoadMoreEpisodes(with: indexPathToAdd)
                    self.isLoadingMoreCharacters = false
                }
            case .failure(let failure):
                print(String(describing: failure))
                self.isLoadingMoreCharacters = false
            }
        }
    }
}

// MARK: - CollectionView

//extension EpisodeListViewModel: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cellViewModels.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.cellIdentifier, for: indexPath) as? CharacterCollectionViewCell else {
//            fatalError("Unsupported cell")
//        }
//        cell.configure(with: cellViewModels[indexPath.row])
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        guard kind == UICollectionView.elementKindSectionFooter,
//              let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
//                                                                           withReuseIdentifier: FooterLoadingCollectionReusableView.identifier,
//                                                                           for: indexPath) as? FooterLoadingCollectionReusableView
//        else {
//            fatalError("Unsupported")
//        }
//        footer.startAnimating()
//        return footer
//    }
//}
//
//extension CharacterListViewModel: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let bounds = UIScreen.main.bounds
//        let width = (bounds.width-30)/2
//        let height = width * 1.5
//        return CGSize(width: width, height: height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        let character = characters[indexPath.row]
//        delegate?.didSelectCharacter(character)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        guard shouldShowLoadMoreIndicator else {
//            return .zero
//        }
//        return CGSize(width: collectionView.frame.width, height: 100)
//    }
//}
//
//// MARK: - ScrollView Delegate
//extension CharacterListViewModel: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        guard
//            shouldShowLoadMoreIndicator,
//            !isLoadingMoreCharacters,
//            !cellViewModels.isEmpty,
//            let nextUrlString = apiInfo?.next,
//            let url = URL(string: nextUrlString)
//        else { return }
//        let offset = scrollView.contentOffset.y
//        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] timer in
//            let totalContentHeight = scrollView.contentSize.height
//            let totalScrollViewFixedHeight = scrollView.frame.size.height
//            
//            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
//                self?.fetchAdditionalCharacters(url: url)
//            }
//            timer.invalidate()
//        }
//    }
//}
