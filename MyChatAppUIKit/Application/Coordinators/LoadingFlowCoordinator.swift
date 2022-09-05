//
//  LoadingFlowCoordinator.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 04.09.2022.
//

import UIKit
import Combine

class LoadingFlowCoordinator: Coordinator {
    private(set) var rootViewController = UINavigationController()
    var appFlowValue: CurrentValueSubject<AppFlow, Never>
    
    lazy var loginViewController: LoginViewController = {
        let vc = LoginViewController()
//        vc.viewModel = viewModel
        vc.goToMainFlow = { [weak self] in
            self?.goToMainFlow()
        }
        return vc
    }()
    
    init(appFlowValue: CurrentValueSubject<AppFlow, Never>) {
        self.appFlowValue = appFlowValue
    }
    
    func start() {
        rootViewController.setViewControllers([loginViewController], animated: false)
    }
    
    private func goToMainFlow() {
        self.appFlowValue.send(.main)
    }
}
