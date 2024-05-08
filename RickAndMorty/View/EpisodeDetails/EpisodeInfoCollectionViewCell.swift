//
//  EpisodeInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 07/05/24.
//

import UIKit

final class EpisodeInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "EpisodeInfoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: EpisodeInfoCollectionViewCellViewModel) {
        
    }
    
    private func setupLayer() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
    }
}
