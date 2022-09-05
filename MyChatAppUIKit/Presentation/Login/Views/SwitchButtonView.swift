//
//  SwitchButtonView.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 05.09.2022.
//

import UIKit

class SwitchButtonView: UIButton {
    
    // MARK: - Properties
    
    private var attributedTitle = NSMutableAttributedString()
    
    private var opacity: CGFloat = 1  {
        didSet {
            self.alpha = opacity
        }
    }
    
    // MARK: - Lifecycle

    init(firstTitle: String, secondTitle: String, target: Any?, selector: Selector) {
        super.init(frame: .zero)
        
        let attributedTitle = NSMutableAttributedString(string: firstTitle,
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.blueMainColor])
        
        attributedTitle.append(NSMutableAttributedString(string: secondTitle,
                                                         attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.blueMainColor]))
        self.attributedTitle = attributedTitle
        setAttributedTitle(self.attributedTitle, for: .normal)
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
}
