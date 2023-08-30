//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Alejandro Robles on 22/08/23.
//

import UIKit

/// Controller to house tabs and root tab controllers
final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let characterVC = CharacterViewController()
        let locationVC = LocationViewController()
        let episodeVC = EpisodeViewController()
        let settingsVC = SettingsViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let navigationCharacter = UINavigationController(rootViewController: characterVC)
        let navigationLocation = UINavigationController(rootViewController: locationVC)
        let navigationEpisode = UINavigationController(rootViewController: episodeVC)
        let navigationSettings = UINavigationController(rootViewController: settingsVC)
        
        navigationCharacter.tabBarItem = UITabBarItem(title: "Characters",
                                                      image: UIImage(systemName: "person"),
                                                      tag: 1)
        navigationLocation.tabBarItem = UITabBarItem(title: "Locations",
                                                     image: UIImage(systemName: "globe"),
                                                     tag: 2)
        navigationEpisode.tabBarItem = UITabBarItem(title: "Episodes",
                                                     image: UIImage(systemName: "tv"),
                                                     tag: 3)
        navigationSettings.tabBarItem = UITabBarItem(title: "Settings",
                                                     image: UIImage(systemName: "gear"),
                                                     tag: 4)
        
        for navigation in [navigationCharacter, navigationLocation, navigationEpisode, navigationSettings] {
            navigation.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([navigationCharacter, navigationLocation, navigationEpisode, navigationSettings], animated: true)
    }
}

