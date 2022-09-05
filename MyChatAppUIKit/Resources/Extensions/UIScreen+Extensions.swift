//
//  UIScreen+Extensions.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 05.09.2022.
//

import UIKit

extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static var bigSize: CGFloat { return max(UIScreen.width, UIScreen.height) }
    static var smallSize: CGFloat { return min(UIScreen.width, UIScreen.height) }
    static let size = UIScreen.main.bounds.size
    static var statusBarHeight: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    static var isSmallScreen: Bool {
        UIDevice().userInterfaceIdiom == .phone &&  UIScreen.main.nativeBounds.height <= 1334
    }
}
