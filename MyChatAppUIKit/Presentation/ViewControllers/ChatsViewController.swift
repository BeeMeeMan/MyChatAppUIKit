//
//  ChatsViewController.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 30.08.2022.
//

import UIKit
import Combine

class ChatsViewController: UIViewController {
    
    // MARK: - Properties
    
    var showDetailRequest: () -> Void = {}
    var subscription = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        view.backgroundColor = .red
    }
}

