//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import UIKit

/// Controller to show and search for Characters
final class CharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
