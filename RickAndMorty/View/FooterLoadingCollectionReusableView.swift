//
//  FooterLoadingCollectionReusableView.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/09/23.
//

import UIKit

final class FooterLoadingCollectionReusableView: UICollectionReusableView {
    static let identifier = "FooterLoadingCollectionReusableView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        
    }
}
