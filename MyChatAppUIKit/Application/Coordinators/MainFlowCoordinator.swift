//
//  MainFlowCoordinator.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 04.09.2022.
//

import UIKit

class MainFlowCoordinator: Coordinator {
    var rootViewController = UITabBarController()
    var childCoordinators = [Coordinator]()
    
    func start() {
        let firstCoordinator = ChatCoordinator()
        firstCoordinator.start()
        childCoordinators.append(firstCoordinator)
        
        let secondCoordinator = SettingsCoordinator()
        secondCoordinator.start()
        childCoordinators.append(secondCoordinator)
        
        rootViewController.viewControllers = [firstCoordinator.rootViewController, secondCoordinator.rootViewController]
        
        firstCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "person"), selectedImage: nil)
        secondCoordinator.rootViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "gear"), selectedImage: nil)
    }
}
