//
//  LoginPage.swift
//  MyChatAppUIKitUITests
//
//  Created by Yevhenii Korsun on 31.08.2022.
//

import Foundation
import XCTest

class LoginPage: UITestable {
    func launch() {
        XCUIApplication().launch()
    }
    
    func typeInName(_ text: String) {
        self.type(text: text, inTextFieldWithInentifier: TestIdentifiers.LoginPage.usernameTextField)
    }
    
    func typeInPassword(_ text: String) {
        self.type(text: text, inTextFieldWithInentifier: TestIdentifiers.LoginPage.passwordTextField)
    }
    
    func tapApplyButton() {
        self.tap(buttonWithInentifier: TestIdentifiers.LoginPage.loginButton)
    }
    
    var messageText: String {
        self.readTextInLabel(withIdentifier: TestIdentifiers.LoginPage.infoLabel)
    }
}
