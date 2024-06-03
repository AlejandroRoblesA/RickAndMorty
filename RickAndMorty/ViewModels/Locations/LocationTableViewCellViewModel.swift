//
//  LocationTableViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 03/06/24.
//

import Foundation

struct LocationTableViewCellViewModel {
    private let location: Location
    
    public var name: String {
        return location.name
    }
    
    public var type: String {
        return location.type
    }
    
    public var dimension: String {
        return location.dimension
    }

    
    init(location: Location) {
        self.location = location
    }
}

extension LocationTableViewCellViewModel: Hashable, Equatable {
    static func == (lhs: LocationTableViewCellViewModel, rhs: LocationTableViewCellViewModel) -> Bool {
        return lhs.location.id == rhs.location.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(location.id)
        hasher.combine(dimension)
        hasher.combine(type)
    }
}
