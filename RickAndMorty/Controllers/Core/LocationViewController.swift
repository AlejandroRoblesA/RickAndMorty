//
//  LocationViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import UIKit

/// Controller to show and search for Location
final class LocationViewController: UIViewController {
    
    private let primaryView = LocationView()
    private let viewModel = LocationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        primaryView.delegate = self
        view.addSubview(primaryView)
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
        addConstraints()
        viewModel.delegate = self
        viewModel.fetchLocations()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func didTapSearch() {
        
    }
}

// MARK: - LocationViewModelDelegate
extension LocationViewController: LocationViewModelDelegate {
    func didFetchInitialLocation() {
        primaryView.configure(with: viewModel)
    }
}

// MARK: - LocationViewDelegate
extension LocationViewController: LocationViewDelegate {
    func locationView(_ locationView: LocationView, didSelect location: Location) {
        let locationDetailViewController = LocationDetailViewController(location: location)
        locationDetailViewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(locationDetailViewController, animated: true)
    }
}
