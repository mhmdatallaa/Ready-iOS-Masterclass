//
//  SettingsViewController.swift
//  ReadyUIKiteTask
//
//  Created by Mohamed Atallah on 16/12/2025.
//

import UIKit

enum AppTheme: String {
    case light
    case dark
}

class SettingsViewController: UIViewController {
    @IBOutlet weak private(set) var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let themeRaw = UserDefaults.standard.string(forKey: "app_theme")
            darkModeSwitch.isOn = (themeRaw == AppTheme.dark.rawValue)
    }
    
    @IBAction private func darkModeChanged(_ sender: UISwitch) {
        let theme: AppTheme = sender.isOn ? .dark : .light
        UserDefaults.standard.set(theme.rawValue, forKey: "app_theme")
        applyTheme(theme)
    }

    private func applyTheme(_ theme: AppTheme) {
        let style: UIUserInterfaceStyle = (theme == .dark) ? .dark : .light

        UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .forEach { $0.overrideUserInterfaceStyle = style }
    }
   
}
