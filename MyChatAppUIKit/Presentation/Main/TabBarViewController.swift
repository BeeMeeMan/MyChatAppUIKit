//
//  TabBarViewController.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 30.08.2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: - Properties
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Switch", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor.systemPurple, for: .normal)
        button.addTarget(self, action: #selector(handleSendMessage), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleSendMessage() {
        print("#handleSendMessage")
    }
    
    // MARK: - API
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        view.backgroundColor = .green
        
        view.addSubview(sendButton)
        sendButton.center(by: .allAxis, inView: view)
    }
}
