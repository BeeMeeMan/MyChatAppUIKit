//
//  LoginViewController.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 30.08.2022.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var loginButton = LoginButton(title: "Login",
                                               target: self,
                                               selector:  #selector(handleLogin),
                                               authViewState: .login)
    
    private lazy var appLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ChalkboardSE-Regular", size: 48)
        label.textColor = .blueMainColor
        label.textAlignment = .center
        label.text = "Chat App"
        label.addShadow()
        
        return label
    }()
    
    private let dontHaveAccountButton = SwitchButtonView(firstTitle: "Don't have an account?   ",
                                                         secondTitle: "Sign Up",
                                                         target: self,
                                                         selector: #selector(handleSignUp))
    
    private lazy var containerArray = [InputContainerView(type: .email),
                                       InputContainerView(type: .password)]
    
    private lazy var logoView = LogoView(diametr: 160, authViewState: .login)
    var goToMainFlow: () -> Void = {}
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func handleSignUp() {
        //        goToMainFlow()
        
        print("#handleSignUp")
    }
    
    @objc func handleLogin() {
        //        goToMainFlow()
        
        print("#handleLogin")
    }

    // MARK: - API
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        configureBackground()
        
        view.addSubview(logoView)
        logoView.center(by: .xAxis, inView: view)
        logoView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        
        view.addSubview(appLabel)
        appLabel.anchor(top: logoView.bottomAnchor, paddingTop: 40)
        appLabel.center(by: .xAxis, inView: view)
        
        let viewArray = containerArray + [loginButton, UIView(), dontHaveAccountButton]
        let stack = UIStackView(arrangedSubviews: viewArray)
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.center(by: .xAxis, inView: view)
        stack.anchor(top: appLabel.bottomAnchor,
                     bottom: view.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingBottom: 64,
                     paddingLeft: 32,
                     paddingRight: 32)
    }
    
    private func configureBackground() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.blueBackgroundColor.cgColor,
                           UIColor.white.cgColor,
                           UIColor.pinkBackgroundColor.cgColor,]
        gradient.type = .radial
        gradient.startPoint =  CGPoint(x: 0.8, y: 0.2)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

    deinit {
        print("#LoginDEinit")
    }
}
