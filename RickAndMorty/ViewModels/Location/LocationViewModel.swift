//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 21/05/24.
//

import Foundation

final class LocationViewModel {
    
    private var locations: [Location] = []
    private var hasMoreResults: Bool {
        return false
    }
    
    // Location response info
    // Will contain next url, if present
    private var cellViewModels: [String] = []
    
    init() {}
    
    public func fetchLocations() {
        Service.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                print(model)
                break
            case .failure(let error):
                break
            }
        }
    }
    
    
}
