//
//  CustomButtom.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 4/8/19.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

import ChameleonFramework

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        setupButton()
        
    }
    
    convenience init(buttonTitle: String, buttonIconImage: String, buttonTag tag: Int, buttonHeight: CGFloat, buttonWidth: CGFloat) {
        
        self.init()
        
        setTitle(buttonTitle, for: .normal)
        
        if let buttonImage = UIImage(named: buttonIconImage) {
        
        setImage(buttonImage, for: .normal)
            
        }
        
        setConstraints(buttonHeight: buttonHeight, buttonWidth: buttonWidth)
        
        self.tag = tag
        
        setupButton()
        
    }
    
    func setupButton() {
        
        setShadow()
        
        setTitleColor(.black, for: .normal)
        
        setTitleColor(.white, for: .highlighted)
        
        titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 18)
        
        backgroundColor = UIColor(hexString: "#FA8072")
        
        layer.cornerRadius = 25
        
        layer.borderWidth = 3.0
        
        layer.borderColor = UIColor.yellow.cgColor
        
        showsTouchWhenHighlighted = true
        
        alpha = 0.60
        
        contentHorizontalAlignment = .center
        
    }
    
    private func setShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
        
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        
        layer.shadowRadius = 8
        
        layer.shadowOpacity = 0.5
        
        clipsToBounds = true
        
        layer.masksToBounds = false
        
    }
    
    // The below Method uses CoreAnimation to create Shake animation:
    
    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        
        shake.duration = 0.1
        
        shake.repeatCount = 2
        
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x-8, y: center.y)
        
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x+8, y: center.y)
        
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
        
    }
    
    func setConstraints(buttonHeight height: CGFloat, buttonWidth width: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: height),
            
            widthAnchor.constraint(equalToConstant: width)
        
            
            ])
        
    }
    
}