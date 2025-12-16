//
//  SceneDelegate.swift
//  ReadyUIKiteTask
//
//  Created by Mohamed Atallah on 14/12/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        window?.makeKeyAndVisible()
        
        loadSavedTheme()
    }
    
    private func loadSavedTheme() {
        let themeRaw = UserDefaults.standard.string(forKey: "app_theme")
            let theme = AppTheme(rawValue: themeRaw ?? "") ?? .light

            window?.overrideUserInterfaceStyle =
                (theme == .dark) ? .dark : .light
    }
}

