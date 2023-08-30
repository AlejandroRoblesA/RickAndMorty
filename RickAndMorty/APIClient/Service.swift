//
//  Services.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 29/08/23.
//

import Foundation

final class Service {
    static let shared = Service()
    
    private init() { }
    
    public func execute(_ request: Request, completion: @escaping () -> Void ) {
        
    }
}
