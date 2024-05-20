//
//  SettingsViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import UIKit
import SwiftUI
import SafariServices
import StoreKit

/// Controller to show various app options and settings
final class SettingsViewController: UIViewController {

    private var settingsSwiftUIView: UIHostingController<SettingsView>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Settings"
        addSwiftUIView()
    }
    
    private func addSwiftUIView() {
        
        let settingsHostingController = UIHostingController(rootView: SettingsView(viewModel: SettingsViewModel(cellViewModels: SettingsOption.allCases.compactMap({
            return SettingsCellViewModel(type: $0) { [weak self] option in
                guard let self = self else { return }
                self.handleTap(option: option)
            }
        }))))
    
        addChild(settingsHostingController)
        settingsHostingController.didMove(toParent: self)
        view.addSubview(settingsHostingController.view)
        settingsHostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsHostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsHostingController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsHostingController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsHostingController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        self.settingsSwiftUIView = settingsHostingController
    }
    
    private func handleTap(option: SettingsOption) {
        guard Thread.current.isMainThread else { return }
        
        if let url = option.targetUrl {
            // Open website
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true)
        } else if option == .rateApp {
            // Show rating prompt
            if let windowScene = view.window?.windowScene {
                SKStoreReviewController.requestReview(in: windowScene)
            }
        }
    }
}
