//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/09/23.
//

import UIKit

/// View that habdles showing list of characters, loader, etc.
final class CharacterListView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
