//
//  LocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 03/06/24.
//

import UIKit

final class LocationTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "LocationTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: LocationTableViewCellViewModel) {
        
    }
}
