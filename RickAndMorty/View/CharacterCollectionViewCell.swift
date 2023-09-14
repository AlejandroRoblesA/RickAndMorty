//
//  CharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 14/09/23.
//

import UIKit

/// Single cell for a character
final class CharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CharacterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: CharacterCollectionViewCellViewModel) {
        
    }
}
