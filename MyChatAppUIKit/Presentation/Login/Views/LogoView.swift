//
//  LogoView.swift
//  MyChatAppUIKit
//
//  Created by Yevhenii Korsun on 05.09.2022.
//

import UIKit

class LogoView: UIView {
    
    // MARK: - Properties
    
    var diametr: CGFloat
    
    private var authViewState: AuthViewState
    private let circleColors: [UIColor] = [.white, .blueBackgroundColor, .pinkBackgroundColor]
    private  let stack = UIStackView()
    
    // MARK: - Lifecycle
    
    convenience init(diametr: CGFloat, authViewState: AuthViewState) {
        self.init(frame: .zero)
        self.diametr = diametr
        self.authViewState = authViewState
        configureUI()
        setDimensions(height: diametr, width: diametr)
    }
    
    override init(frame: CGRect) {
        diametr = 0
        self.authViewState = .login
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        stack.axis = .vertical
        stack.spacing = 0
        
        for index in (0...2).reversed() {
            let circle = UIView(frame: frame)
            circle.backgroundColor = circleColors[index].withAlphaComponent(index == 0 ? 1 : 0.1)
            circle.layer.borderColor = UIColor.white.cgColor
            circle.layer.borderWidth = 0.6
            let dimention: CGFloat = diametr + CGFloat(index) * diametr * 0.35
            circle.setDimensions(height: dimention, width: dimention)
            circle.layer.cornerRadius = dimention / 2
            
            if index == 0 {
                circle.addSubview(stack)
                stack.center(by: .allAxis, inView: circle)
            }
            
            addSubview(circle)
            circle.center(by: .allAxis, inView: self)
        }
        
        switch authViewState {
        case .login: configureLoginState()
        case .singUp: configureSinginState()
        }
    }
    
    private func configureSinginState() {
        let addPhotoButton = UIButton(type: .system)
        let image = UIImage(systemName: "plus.circle.fill")?.withTintColor(.pinkMainColor, renderingMode: .alwaysOriginal)
        addPhotoButton.setImage(image, for: .normal)
        addPhotoButton.contentHorizontalAlignment = .fill
        addPhotoButton.contentVerticalAlignment = .fill
        //        addPhotoButton.addTarget(self, action: #selector(handleSendMessage), for: .touchUpInside)
        
        addPhotoButton.setDimensions(height: diametr, width: diametr)
        addSubview(addPhotoButton)
    }
    
    private func configureLoginState() {
        for index in 0...1 {
            let imageView = UIImageView()
            let image = UIImage(systemName: "ellipsis.bubble.fill")?.withTintColor(.pinkMainColor, renderingMode: .alwaysOriginal)
            imageView.image = image
            imageView.setDimensions(height: diametr * 0.27, width: diametr * 0.37)
            
            var positionArray = [UIView]()
            
            if index == 0 {
                positionArray = [imageView, UIView()]
            } else {
                imageView.makeSymetric()
                positionArray = [UIView(), imageView]
            }
            
            let hStack = UIStackView(arrangedSubviews: positionArray)
            hStack.axis = .horizontal
            hStack.spacing = 50
            
            stack.addArrangedSubview(hStack)
        }
    }
}
