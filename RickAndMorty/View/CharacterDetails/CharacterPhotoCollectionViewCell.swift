//
//  CharacterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 05/10/23.
//

import UIKit

final class CharacterPhotoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CharacterPhotoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setUpConstraints() {
        
    }
    
    public func configure(with viewModel: CharacterPhotoCollectionViewCellViewModel) {
        
    }
}
