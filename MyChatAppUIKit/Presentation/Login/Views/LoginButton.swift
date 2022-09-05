//
//  LoginButtonView.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 05.09.2022.
//

import UIKit

class LoginButton: UIButton {
    
    // MARK: - Properties
    
    private let authViewState: AuthViewState
    
    private var opacity: CGFloat = 1  {
        didSet {
            self.alpha = opacity
        }
    }
    
    // MARK: - Lifecycle
    
    init(title: String, target: Any?, selector: Selector, authViewState: AuthViewState) {
        self.authViewState = authViewState
        super.init(frame: .zero)
      
        setTitle(title, for: .normal)
        layer.cornerRadius = 5
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setHeight(50)
        setTitleColor(UIColor.white, for: .normal)
        isActive(false)
        addTarget(target, action: selector, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        opacity = 0.5
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        opacity = 1
        super.touchesEnded(touches, with: event)
    }
    
    // MARK: - API functions
    
    func isActive(_ isActive: Bool) {
        isUserInteractionEnabled = isActive
        backgroundColor = (isActive ? UIColor.pinkMainColor : UIColor.lightGray)
    }
}
