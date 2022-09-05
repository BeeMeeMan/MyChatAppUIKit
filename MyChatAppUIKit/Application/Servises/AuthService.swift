//
//  AuthService.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 30.08.2022.
//

import Foundation

protocol Authorisable {
    func isLoggedIn() -> Bool
}

class AuthService: Authorisable {
    
    func isLoggedIn() -> Bool {
        return false
    }
}
