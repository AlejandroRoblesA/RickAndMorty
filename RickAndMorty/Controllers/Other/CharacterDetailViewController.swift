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
    private let detailView: CharacterDetailView
    
    // MARK: - Init
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        self.detailView = CharacterDetailView(frame: .zero, viewModel: viewModel)
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
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(didTapShare))
        addConstraints()
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
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
        // Share character info
    }
}

// MARK: - CollectionView

extension CharacterDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
        case .photo(viewModel: let viewModel):
            guard 
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterPhotoCollectionViewCell.cellIdentifier,
                                                              for: indexPath) as? CharacterPhotoCollectionViewCell
            else { fatalError() }
            cell.configure(with: viewModel)
            return cell
        case .information(viewModels: let viewModels):
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterInfoCollectionViewCell.cellIdentifier,
                                                              for: indexPath) as? CharacterInfoCollectionViewCell
            else { fatalError() }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        case .episodes(viewModels: let viewModels):
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterEpisodeCollectionViewCell.cellIdentifier,
                                                              for: indexPath) as? CharacterEpisodeCollectionViewCell
            else { fatalError() }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        }
    }
}

extension CharacterDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        switch sectionType {
        case .photo:
            return 1
        case .information(let viewModels):
            return viewModels.count
        case .episodes(let viewModels):
            return viewModels.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }
}
