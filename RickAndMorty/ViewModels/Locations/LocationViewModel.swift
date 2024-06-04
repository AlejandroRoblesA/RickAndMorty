//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/05/24.
//

import Foundation

protocol LocationViewModelDelegate: AnyObject {
    func didFetchInitialLocation()
}

final class LocationViewModel {
    
    weak var delegate: LocationViewModelDelegate?
    
    private var locations: [Location] = [] {
        didSet {
            for location in locations {
                let cellViewModel = LocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    private var hasMoreResults: Bool {
        return false
    }
    
    // Location response info
    // Will contain next url, if present
    public private(set) var cellViewModels: [LocationTableViewCellViewModel] = []
    
    private var apiInfo: GetAllLocationsResponse.Info?
    
    init() {}
    
    public func fetchLocations() {
        Service.shared.execute(.listLocationsRequest, expecting: GetAllLocationsResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocation()
                }
            case .failure(let error):
                break
            }
        }
    }
    
    public func location(at index: Int) -> Location? {
        guard index >= locations.count else { return nil }
        return self.locations[index]
    }
}
