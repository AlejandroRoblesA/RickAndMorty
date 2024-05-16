//
//  SettingsOption.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 13/05/24.
//

import UIKit

enum SettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReference
    case viewSeries
    case viewCode
    
    var targetUrl: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactUs:
            return URL(string: "https://www.google.com/")
        case .terms:
            return URL(string: "")
        case .privacy:
            return URL(string: "")
        case .apiReference:
            return URL(string: "")
        case .viewSeries:
            return URL(string: "")
        case .viewCode:
            return URL(string: "")
        }
    }
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of service"
        case .privacy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .privacy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .viewSeries:
            return UIImage(systemName: "tv.fill")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
                .systemBlue
        case .contactUs:
                .systemGreen
        case .terms:
                .systemRed
        case .privacy:
                .systemCyan
        case .apiReference:
                .systemOrange
        case .viewSeries:
                .systemPurple
        case .viewCode:
                .systemPink
        }
    }
}
