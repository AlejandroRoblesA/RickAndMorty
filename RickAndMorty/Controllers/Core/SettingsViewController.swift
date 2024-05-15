//
//  SettingsViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import UIKit
import SwiftUI

/// Controller to show various app options and settings
final class SettingsViewController: UIViewController {

    private let settingsSwiftUIView = UIHostingController(rootView: SettingsView(viewModel: SettingsViewModel(cellViewModels: SettingsOption.allCases.compactMap({
        return SettingsCellViewModel(type: $0)
    }))))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Settings"
        addSwiftUIView()
    }
    
    private func addSwiftUIView() {
        addChild(settingsSwiftUIView)
        settingsSwiftUIView.didMove(toParent: self)
        view.addSubview(settingsSwiftUIView.view)
        settingsSwiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsSwiftUIView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIView.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsSwiftUIView.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsSwiftUIView.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
