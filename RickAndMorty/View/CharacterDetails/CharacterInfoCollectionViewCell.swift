//
//  CharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 05/10/23.
//

import UIKit

final class CharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CharacterInfoCollectionViewCell"
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Earth"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location"
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "globe.americas")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.addSubviews(titleLabel, valueLabel, iconImageView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        valueLabel.text = nil
        titleLabel.text = nil
        iconImageView.image = nil
    }
    
    private func setUpConstraints() {
        
    }
    
    public func configure(with viewModel: CharacterInfoCollectionViewCellViewModel) {
        
    }
}
