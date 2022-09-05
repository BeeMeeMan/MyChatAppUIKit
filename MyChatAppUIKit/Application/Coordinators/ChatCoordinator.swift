//
//  ChatCoordinator.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 04.09.2022.
//

import UIKit

class ChatCoordinator: Coordinator {
    private(set) var rootViewController = UINavigationController()
    
    lazy var chatsViewController: ChatsViewController = {
        let vc = ChatsViewController()
        vc.title = "Chats"
//        vc.viewModel = viewModel
        vc.showDetailRequest = { [weak self] in
            self?.goToDetail()
        }
        return vc
    }()
    
    func start() {
        rootViewController.setViewControllers([chatsViewController], animated: false)
    }
    
    private func goToDetail() {
//        let dv = FirstDetailView(viewModel: viewModel)
//        let controller = UIHostingController(rootView: dv)
//        rootViewController.pushViewController(controller, animated: true)
    }
}
