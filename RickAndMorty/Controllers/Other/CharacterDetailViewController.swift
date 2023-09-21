//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/09/23.
//

import UIKit

/// Controller to show info about single character
class CharacterDetailViewController: UIViewController {
    private var viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }
}
