//
//  SearchViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 26/03/24.
//

import UIKit

/// Configurable controller to search
final class SearchViewController: UIViewController {

    struct Configuration {
        enum `Type` {
            case character
            case episode
            case location
        }
        
        let type: `Type`
    }
    
    private let configuration: Configuration
    
    init(configuration: Configuration) {
        self.configuration = configuration
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        view.backgroundColor = .systemBackground
    }
}
