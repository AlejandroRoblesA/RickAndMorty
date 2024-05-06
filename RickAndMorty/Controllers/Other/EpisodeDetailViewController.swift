//
//  EpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 19/03/24.
//

import UIKit

// MARK: - EpisodeDetailViewController
final class EpisodeDetailViewController: UIViewController {

    private let viewModel: EpisodeDetailViewModel
    private let detailView = EpisodeDetailView()
    
    init(url: URL?) {
        self.viewModel = EpisodeDetailViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(detailView)
        addConstraints()
        title = "Episode"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        viewModel.delegate = self
        viewModel.fetchEpisodeData()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func didTapShare() {
        
    }
}

// MARK: - EpisodeDetailViewModelDelegate
extension EpisodeDetailViewController: EpisodeDetailViewModelDelegate {
    func didFetchEpisodeDetails() {
        detailView.configure(with: viewModel)
    }
}
