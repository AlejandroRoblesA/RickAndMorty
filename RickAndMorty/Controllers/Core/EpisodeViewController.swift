//
//  EpisodeViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import UIKit

/// Controller to show and search for Episodes
final class EpisodeViewController: UIViewController, EpisodeListViewDelegate {
    
    private let episodeListView = EpisodeListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Episodes"
        setupView()
        addSearchButton()
    }
    
    private func setupView() {
        episodeListView.delegate = self
        view.addSubview(episodeListView)
        
        NSLayoutConstraint.activate([
            episodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            episodeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            episodeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            episodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc func didTapSearch() {
        
    }
    
    func episodeListView(_ episodeListView: EpisodeListView, didSelectEpisode episode: Episode) {
        // Open detail controller for that episode
        let detailVC = EpisodeDetailViewController(url: URL(string: episode.url))
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
