//
//  SceneDelegate.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 30.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var appCoordinator: AppFlowCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        appCoordinator = AppFlowCoordinator(window: window)
        appCoordinator?.start()
        AppApperance.setupDefault()
        window.makeKeyAndVisible()
    }
}
