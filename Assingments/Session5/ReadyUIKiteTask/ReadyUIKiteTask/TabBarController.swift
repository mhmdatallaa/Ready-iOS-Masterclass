//
//  TabBarController.swift
//  ReadyUIKiteTask
//
//  Created by Mohamed Atallah on 15/12/2025.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profile = UINavigationController(rootViewController: ProfileViewController())
        let edit = UINavigationController(rootViewController:EditProfileViewController())
        let settings = UINavigationController(rootViewController: SettingsViewController())
        
        profile.title = "Profile"
        edit.title = "Edit"
        settings.title = "Settings"
        
        setViewControllers([profile, edit, settings], animated: true)
        
        guard let items = tabBar.items else { return }
        let images = ["person", "pencil", "gear"]
        
        for index in 0...2 {
            items[index].image = UIImage(systemName: images[index])
        }
        
//        tabBar.backgroundColor = .system
        tabBar.tintColor = .systemBlue
    }
}
