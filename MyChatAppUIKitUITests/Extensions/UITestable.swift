//
//  UITestable.swift
//  MyChatAppUIKitUITests
//
//  Created by Yevhenii Korsun on 31.08.2022.
//

import Foundation
import XCTest

protocol UITestable {}

extension UITestable {
    func type(text: String, inTextFieldWithInentifier inentifier: String) {
        let textField = XCUIApplication().textFields[inentifier]
        textField.tap()
        textField.typeText(text + "\n")
    }
    
    func tap(buttonWithInentifier inentifier: String) {
        XCUIApplication().buttons[inentifier].tap()
    }
    
    func readTextInLabel(withIdentifier identifier: String) -> String {
        let messageLabel = XCUIApplication().staticTexts[identifier]
        return messageLabel.label
    }
}
