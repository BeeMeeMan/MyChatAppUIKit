//
//  AppCoordinator.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 30.08.2022.
//

import UIKit
import Combine

enum AppFlow {
    case login
    case main
}

class AppFlowCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    let appFlowValue = CurrentValueSubject<AppFlow, Never>(.login)
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Coordinator
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        appFlowValue
            .removeDuplicates()
            .sink { [weak self] appFlow in
                switch appFlow {
                case .login:
                    if let appFlowValue = self?.appFlowValue {
                        self?.runLoginFlow(appFlowValue: appFlowValue)
                    }
                case .main:
                    self?.runMainFlow()
                }
            }
            .store(in: &subscriptions)
    }
    
    private func runMainFlow() {
        let mainCoordinator =  MainFlowCoordinator()
        mainCoordinator.start()
        childCoordinators = [mainCoordinator]
        window.rootViewController = mainCoordinator.rootViewController
    }
    
    private func runLoginFlow(appFlowValue: CurrentValueSubject<AppFlow, Never>) {
        let loginCoordinator = LoadingFlowCoordinator(appFlowValue: appFlowValue)
        loginCoordinator.start()
        childCoordinators = [loginCoordinator]
        window.rootViewController = loginCoordinator.rootViewController
    }
}
