//
//  InputContainerView.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 05.09.2022.
//

import UIKit

enum InputContainerType {
    case email
    case password
    case fullName
    case userName
    
    var placeholder: String {
        switch self {
        case .email: return "Email"
        case .password: return "Password"
        case .fullName: return "Full Name"
        case .userName: return "Username"
        }
    }
    
    var imageName: String {
        switch self {
        case .email: return "envelope"
        case .password: return "lock"
        case .fullName, .userName: return "person"
        }
    }
    
    var isSecure: Bool {
        switch self {
        case .password: return true
        default: return false
        }
    }
}

class InputContainerView: UIView {
    
    // MARK: - Properties
    
    let textField = UITextField()
    var type: InputContainerType
    
    // MARK: - Lifecycle
    
    init(type: InputContainerType) {
        self.type = type
        super.init(frame: .zero)
        
        setDimensions(height: 50, width: UIScreen.width * 0.8)
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: type.imageName)
        imageView.tintColor = .pinkMainColor
        
        addSubview(imageView)
        imageView.center(by: .yAxis, inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 24, width: 28)
        
        let lineView = UIView()
        lineView.backgroundColor = .pinkMainColor
        lineView.setHeight(0.75)
        addSubview(lineView)
        lineView.anchor(bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, paddingBottom: 4, paddingLeft: 4, paddingRight: 4)
        
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.autocorrectionType = .no
        textField.keyboardAppearance = .light
        textField.attributedPlaceholder = NSAttributedString(string: type.placeholder, attributes: [.foregroundColor: UIColor.pinkMainColor])
        addSubview(textField)
        textField.center(by: .yAxis, inView: self)
        textField.anchor(left: imageView.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 8)
        textField.isSecureTextEntry = type.isSecure
        textField.addTarget(self, action: #selector(detectInput), for: .editingChanged)
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func detectInput() {
        print("DetectInput")
    }
}

extension InputContainerView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("#deactivate")
        return true
    }
}
