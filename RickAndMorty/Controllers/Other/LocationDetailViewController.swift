//
//  LocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 19/06/24.
//

import UIKit

//final class LocationDetailViewController: UIViewController {
//
//    private let location: Location
//    
//    // MARK: - Init
//    init(location: Location) {
//        self.location = location
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "Location"
//        view.backgroundColor = .systemBackground
//    }
//}

// MARK: - LocationDetailViewController
final class LocationDetailViewController: UIViewController {

    private let viewModel: LocationDetailViewModel
    private let detailView = LocationDetailView()
    
    init(location: Location) {
        let url = URL(string: location.url)
        self.viewModel = LocationDetailViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(detailView)
        addConstraints()
        detailView.delegate = self
        title = "Location"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        viewModel.delegate = self
        viewModel.fetchLocationData()
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

// MARK: - LocationDetailViewModelDelegate
extension LocationDetailViewController: LocationDetailViewModelDelegate {
    func didFetchLocationDetails() {
        detailView.configure(with: viewModel)
    }
}

// MARK: - LocationDetailViewDelegate
extension LocationDetailViewController: LocationDetailViewDelegate {
    func locationDetailView(_ detailView: LocationDetailView, didSelect character: Character) {
        let viewController = CharacterDetailViewController(viewModel: .init(character: character))
        viewController.title = character.name
        viewController.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(viewController, animated: true)
    }
}
