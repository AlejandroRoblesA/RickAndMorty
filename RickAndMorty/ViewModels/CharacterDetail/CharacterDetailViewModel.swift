//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/09/23.
//

import UIKit

final class CharacterDetailViewModel {
    private let character: Character
    
    enum SectionType {
        case photo(viewModel: CharacterPhotoCollectionViewCellViewModel)
        case information(viewModels: [CharacterInfoCollectionViewCellViewModel])
        case episodes(viewModels: [CharacterEpisodeCollectionViewCellViewModel])
    }
    
    public var sections: [SectionType] = []
    
    public var title: String {
        character.name.uppercased()
    }
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    // MARK: - Init
    
    init(character: Character) {
        self.character = character
        setUpSections()
    }
    
    private func setUpSections() {
        sections = [
            .photo(viewModel: .init()),
            .information(viewModels: [.init(), .init(), .init(), .init()]),
            .episodes(viewModels: [.init(), .init(), .init(), .init()])
        ]
    }
    
    // MARK: - Layouts
    
    public func createPhotoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .fractionalHeight(0.5)),
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createInfoSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                                             heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                     leading: 2,
                                                     bottom: 2,
                                                     trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .absolute(150)),
                                                     subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createEpisodeSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                             heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                     leading: 5,
                                                     bottom: 10,
                                                     trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                                                                        heightDimension: .absolute(150)),
                                                     subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}
