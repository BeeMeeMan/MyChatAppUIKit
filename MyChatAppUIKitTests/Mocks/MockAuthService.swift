//
//  MockAuthService.swift
//  MyChatAppUIKitTests
//
//  Created by Yevhenii Korsun on 30.08.2022.
//

import Foundation
@testable import MyChatAppUIKit

class MockFalseAuthService: Authorisable {
    func logInUser(withUsername username: String, password: String, completion: @escaping() -> Void) {
        
    }
}
