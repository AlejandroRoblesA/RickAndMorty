//
//  APICacheManager.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 20/03/24.
//

import Foundation


/// Manages in memory session scoped API caches
final class APICacheManager {
    
    private var cacheDictionary: [
        Endpoint: NSCache<NSString, NSData>
    ] = [:]
    
    private var cache = NSCache<NSString, NSData>()
    
    init () {
        setupCache()
    }

    // MARK: Private Func
    private func setupCache() {
        Endpoint.allCases.forEach({ endpoint in
            cacheDictionary[endpoint] = NSCache<NSString, NSData>()
        })
    }
    
    // MARK: Public Func
    public func cachedResponse(for endpoint: Endpoint, url: URL?) -> Data? {
        guard 
            let targetCache = cacheDictionary[endpoint],
              let url = url
        else {
            return nil
        }
        let key = url.absoluteString as NSString
        return targetCache.object(forKey: key) as? Data
    }
    
    public func setCache(for endpoint: Endpoint, url: URL?, data: Data) {
        guard
            let targetCache = cacheDictionary[endpoint],
            let url = url
        else {
            return
        }
        let key = url.absoluteString as NSString
        targetCache.setObject(data as NSData, forKey: key)
    }
}
