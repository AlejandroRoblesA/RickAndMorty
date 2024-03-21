//
//  EpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 19/03/24.
//

import UIKit

final class EpisodeDetailViewController: UIViewController {

    private let viewModel: EpisodeDetailViewModel
    
    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Episode"
        view.backgroundColor = .blue
    }
}
