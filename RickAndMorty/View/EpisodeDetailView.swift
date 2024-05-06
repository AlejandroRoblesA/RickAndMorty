//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 20/03/24.
//

import UIKit

final class EpisodeDetailView: UIView {
    
    private var viewModel: EpisodeDetailViewModel?
    private var collectionView: UICollectionView?
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        self.collectionView = createCollectionView()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: Private functions
    private func addConstraints() {
        
    }
    
    private func createCollectionView() -> UICollectionView {
        return UICollectionView()
    }
    
    // MARK: Public functions
    public func configure(with viewModel: EpisodeDetailViewModel) {
        self.viewModel = viewModel
    }
}
