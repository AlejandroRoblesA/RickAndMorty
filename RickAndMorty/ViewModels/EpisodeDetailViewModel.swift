//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 20/03/24.
//

import Foundation

final class EpisodeDetailViewModel {
    private let endpointUrl: URL?
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard
            let url = endpointUrl,
            let request = Request(url: url)
        else {
            return
        }
        
        Service.shared.execute(request, expecting: Episode.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success))
            case .failure(let failure):
                break
            }
        }
    }
}
