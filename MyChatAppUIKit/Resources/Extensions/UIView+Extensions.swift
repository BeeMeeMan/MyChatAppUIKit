//
//  UIView+Extensions.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 05.09.2022.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
    }
    
    func addTapableView(target: AnyObject, action: Selector) {
        let cancelableView = UIView()
        cancelableView.backgroundColor = .clear
        let tap = UITapGestureRecognizer(target: target, action: action)
        cancelableView.addGestureRecognizer(tap)
        cancelableView.isUserInteractionEnabled = true
        self.addSubview(cancelableView)
        cancelableView.pinTo(view: self)
    }
}
