//
//  SettingsCoordinator.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 04.09.2022.
//

import UIKit

class SettingsCoordinator: Coordinator {
    private(set) var rootViewController = UINavigationController()
    
    lazy var settingsViewController: SettingsViewController = {
        let vc = SettingsViewController()
        vc.title = "Settings"

        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([settingsViewController], animated: false)
    }
    
}
