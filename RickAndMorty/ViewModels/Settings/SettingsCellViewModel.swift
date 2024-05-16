//
//  SettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/05/24.
//

import UIKit

struct SettingsCellViewModel: Identifiable {
    
    let id = UUID()
    
    public let type: SettingsOption
    public let onTapHandler: (SettingsOption) -> Void
    
    public var image: UIImage? {
        return type.iconImage
    }
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
    init(type: SettingsOption, onTapHandler: @escaping(SettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
    }
}
