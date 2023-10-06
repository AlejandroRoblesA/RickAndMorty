//
//  CharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 05/10/23.
//

import UIKit

final class CharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CharacterEpisodeCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setUpConstraints() {
        
    }
    
    public func configure(with viewModel: CharacterEpisodeCollectionViewCellViewModel) {
        
    }
}
