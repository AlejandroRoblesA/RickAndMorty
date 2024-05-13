//
//  SettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/05/24.
//

import UIKit

struct SettingsCellViewModel: Identifiable, Hashable {
    
    let id = UUID()
    
    private let type: SettingsOption
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
    init(type: SettingsOption) {
        self.type = type
    }
}
