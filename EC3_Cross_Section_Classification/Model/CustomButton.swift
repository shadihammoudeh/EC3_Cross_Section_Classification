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
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    convenience init(viewButtonWillBeAddedTo hostView: UIView, buttonTitleTexForNormalState titleForNormalState: String, buttonTitleTextColourForNormalState normalTextColour: UIColor, buttonTitleTextColourForHighlightedState highlightedTextColour: UIColor, buttonTitleFontType fontType: String, buttonTitleFontSize fontSize: CGFloat, buttonBackgroundHexColourCode hexColour: String, buttonFrameCornerRadius cornerRadius: CGFloat, buttonFrameBorderWidth borderWidth: CGFloat, buttonFrameBorderColour borderColour: String, buttonBackgroundTransperancyAlphaValue transperancy: CGFloat, buttonTagNumber tagValue: Int, buttonTarget: Any?, buttonSelector: Selector, buttonImageForNormalState normalButtonImage: String) {
        
        self.init()
        
        setupButtonEssentials(viewButtonWillBeAddedTo: hostView, buttonTitleTexForNormalState: titleForNormalState, buttonTitleTextColourForNormalState: normalTextColour, buttonTitleTextColourForHighlightedState: highlightedTextColour, buttonTitleFontType: fontType, buttonTitleFontSize: fontSize, buttonBackgroundHexColourCode: hexColour, buttonFrameCornerRadius: cornerRadius, buttonFrameBorderWidth: borderWidth, buttonFrameBorderColour: borderColour, buttonBackgroundTransperancyAlphaValue: transperancy, buttonTagNumber: tagValue, buttonTarget: buttonTarget, buttonSelector: buttonSelector, buttonImageForNormalState: normalButtonImage)

    }
    
    func setupButtonEssentials(viewButtonWillBeAddedTo hostView: UIView, buttonTitleTexForNormalState titleForNormalState: String, buttonTitleTextColourForNormalState normalTextColour: UIColor, buttonTitleTextColourForHighlightedState highlightedTextColour: UIColor, buttonTitleFontType fontType: String, buttonTitleFontSize fontSize: CGFloat, buttonBackgroundHexColourCode hexColour: String, buttonFrameCornerRadius cornerRadius: CGFloat, buttonFrameBorderWidth borderWidth: CGFloat, buttonFrameBorderColour borderColour: String, buttonBackgroundTransperancyAlphaValue transperancy: CGFloat, buttonTagNumber tagValue: Int, buttonTarget: Any?, buttonSelector: Selector, buttonImageForNormalState normalButtonImage: String) {
                
        setTitleColor(normalTextColour, for: .normal)
        
        setTitleColor(highlightedTextColour, for: .highlighted)
        
        titleLabel?.font = UIFont(name: fontType, size: fontSize)
        
        setTitle(titleForNormalState, for: .normal)
        
        backgroundColor = UIColor(hexString: hexColour)
        
        layer.cornerRadius = cornerRadius
        
        layer.borderWidth =  borderWidth
        
        layer.borderColor = UIColor(hexString: borderColour)?.cgColor
        
        showsTouchWhenHighlighted = true
        
        alpha = transperancy
        
        contentHorizontalAlignment = .center
        
        self.tag = tagValue
        
        addTarget(target, action: buttonSelector, for: .touchUpInside)
        
        if let buttonImage = UIImage(named: normalButtonImage) {
            
            setImage(buttonImage.withRenderingMode(.alwaysOriginal), for: .normal)
            
            contentMode = .scaleAspectFit
            
        }
        
        setShadow()
        
        hostView.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
    
        heightAnchor.constraint(equalToConstant: intrinsicContentSize.height + 5),
        
        widthAnchor.constraint(equalToConstant: intrinsicContentSize.width + 15)
        
        ])

    }
    
    private func setShadow() {
        
        layer.shadowColor = UIColor.black.cgColor
        
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        
        layer.shadowRadius = 8
        
        layer.shadowOpacity = 0.5
        
        clipsToBounds = true
        
        layer.masksToBounds = false
        
    }
    
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
    
}
