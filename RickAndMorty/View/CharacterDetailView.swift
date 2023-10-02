//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/09/23.
//

import UIKit

/// View for single character info
final class CharacterDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemPurple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
