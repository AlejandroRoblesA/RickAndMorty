//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import UIKit

/// Controller to show and search for Characters
final class CharacterViewController: UIViewController {

    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        setupView()
        addSearchButton()
    }
    
    private func setupView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc func didTapSearch() {
        
    }
}

// MARK: - CharacterListViewDelegate
extension CharacterViewController: CharacterListViewDelegate {
    func characterListView(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        // Open detail controller for that character
        let viewModel = CharacterDetailViewModel(character: character)
        let detailViewController = CharacterDetailViewController(viewModel: viewModel)
        detailViewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
