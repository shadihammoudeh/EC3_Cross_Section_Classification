//
//  ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 05/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    let xy = CustomButton(buttonTitle: "Hello")

    
    let documentationButtonPositionAndSize: [String: CGFloat] = ["xCoordinate": 100, "yCoordinate": 100, "width": 200, "height": 64]
    
    let emailUsButtonPositionAndSize: [String: CGFloat] = ["xCoordinate": 100, "yCoordinate": 100, "width": 150, "height": 64]
    
    let buttonTitle: [String: String] = ["newFileButtonTitle": "New File...", "openFileButtonTitle": "Open", "documentationButtonTitle": "Documentation", "emailUsButtonTitle": "Email Us"]
    
    let buttonIconImage: [String: String] = ["newFileButtonIcon": "newFileButtonIcon", "openFileButtonIcon": "openFileButtonIcon", "documentationButtonIcon": "documentationIcon", "emailUsButtonIcon": "emailUsIcon"]
    
    let differentIphoneScreens: [String: Double] = ["iPhoneXsMax,XR": 896, "iPhoneX,Xs": 812, "iPhone6+,6s+,7+,8+": 736, "iPhone6,6s,7,8": 667, "iPhone5,5s,5c,SE": 568]
    
    let differentBackgroundImageSize: [String: Double] = ["iPhoneXsMax,XR": 774, "iPhoneX,Xs": 690, "iPhone6+,6s+,7+,8+": 672, "iPhone6,6s,7,8": 603, "iPhone5,5s,5c,SE": 504]
    
    // vertical position of first button item for iphoneXsmax = 64(navBarHeight) + 100 + 32(buttonheight /2)
    
    // vertical position of second button for iphoneXsMax = 64 (navbar) + 100 + 64(height of first bar) + [total background image height - 100 - 100 - (64*4)]/3 - 64/2
    
    // viewDidLoad() Method gets called after loading the view. Thus, any UI related changes should be done inside it:
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(xy)
        
        xy.addTarget(self, action: #selector(xyPressed(sender:)), for: .touchUpInside)
        
        xy.translatesAutoresizingMaskIntoConstraints = false
        
        xy.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        xy.widthAnchor.constraint(equalToConstant: 280).isActive = true
        
        xy.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        xy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        
        let currentIphoneScreenHeight = Double(UIScreen.main.bounds.size.height)
        
        let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
        
        let window = UIApplication.shared.keyWindow
        
        let topPadding = window?.safeAreaInsets.top
        
        let bottomPadding = window?.safeAreaInsets.bottom
        
        if currentIphoneScreenHeight == differentIphoneScreens["iPhoneXsMax,XR"] {
            
            let newFileButtonPositionAndSize: [String: Double] = ["xCoordinate": 100, "yCoordinate": Double(topPadding!) + Double(navigationBarHeight!) + 100, "width": 185, "height": 64]

            createAnewButtonProgrammatically(buttonXpostion: 100, buttonYposition: newFileButtonPositionAndSize["yCoordinate"]!, buttonWidth: newFileButtonPositionAndSize["width"]!, buttonHeight: newFileButtonPositionAndSize["height"]!, buttonCornerRadius: 20, buttonBackgroundColour: .red, buttonTextSize: 18, buttonTextColourInNormalCondition: .white, buttonTextColourInHighlightedCondition: .blue, buttonTextTitle: buttonTitle["newFileButtonTitle"]!, buttonIconImage: buttonIconImage["newFileButtonIcon"]!).addTarget(self, action: #selector(openFileButtonPressed(sender:)), for: .touchUpInside)
            
            let openFileButtonPositionAndSize: [String: Double] = ["xCoordinate": 100, "yCoordinate": newFileButtonPositionAndSize["yCoordinate"]!, "width": 115, "height": 64]
            
            createAnewButtonProgrammatically(buttonXpostion: 100, buttonYposition: 250, buttonWidth: 150, buttonHeight: 64, buttonCornerRadius: 20, buttonBackgroundColour: .red, buttonTextSize: 18, buttonTextColourInNormalCondition: .white, buttonTextColourInHighlightedCondition: .blue, buttonTextTitle: buttonTitle["openFileButtonTitle"]!, buttonIconImage: buttonIconImage["openFileButtonIcon"]!).addTarget(self, action: #selector(openFileButtonPressed(sender:)), for: .touchUpInside)

            createAnewButtonProgrammatically(buttonXpostion: 100, buttonYposition: 350, buttonWidth: 150, buttonHeight: 64, buttonCornerRadius: 20, buttonBackgroundColour: .red, buttonTextSize: 18, buttonTextColourInNormalCondition: .white, buttonTextColourInHighlightedCondition: .blue, buttonTextTitle: buttonTitle["documentationButtonTitle"]!, buttonIconImage: buttonIconImage["documentationButtonIcon"]!).addTarget(self, action: #selector(openFileButtonPressed(sender:)), for: .touchUpInside)

            createAnewButtonProgrammatically(buttonXpostion: 100, buttonYposition: 450, buttonWidth: 150, buttonHeight: 64, buttonCornerRadius: 20, buttonBackgroundColour: .red, buttonTextSize: 18, buttonTextColourInNormalCondition: .white, buttonTextColourInHighlightedCondition: .blue, buttonTextTitle: buttonTitle["emailUsButtonTitle"]!, buttonIconImage: buttonIconImage["emailUsButtonIcon"]!).addTarget(self, action: #selector(openFileButtonPressed(sender:)), for: .touchUpInside)
            
        } else if currentIphoneScreenHeight == differentIphoneScreens["iPhoneX,Xs"] {
            
            let newFileButtonPositionAndSize: [String: Double] = ["xCoordinate": 100, "yCoordinate": Double(topPadding!) + Double(navigationBarHeight!) + 100-(differentBackgroundImageSize["iPhoneXsMax,XR"]!-differentBackgroundImageSize["iPhoneX,Xs"]!)/5, "width": 185, "height": 64]
            
            createAnewButtonProgrammatically(buttonXpostion: 100, buttonYposition: newFileButtonPositionAndSize["yCoordinate"]!, buttonWidth: newFileButtonPositionAndSize["width"]!, buttonHeight: newFileButtonPositionAndSize["height"]!, buttonCornerRadius: 20, buttonBackgroundColour: .red, buttonTextSize: 18, buttonTextColourInNormalCondition: .white, buttonTextColourInHighlightedCondition: .blue, buttonTextTitle: buttonTitle["newFileButtonTitle"]!, buttonIconImage: buttonIconImage["newFileButtonIcon"]!).addTarget(self, action: #selector(openFileButtonPressed(sender:)), for: .touchUpInside)
            
        }
        
    }
    
    func createAnewButtonProgrammatically (buttonXpostion xCoordinate: Double, buttonYposition yCoordinate: Double, buttonWidth width: Double, buttonHeight height: Double, buttonCornerRadius radius: CGFloat, buttonBackgroundColour colour: UIColor, buttonTextSize fontSize: CGFloat, buttonTextColourInNormalCondition normalTextColour: UIColor, buttonTextColourInHighlightedCondition highlightedTextColour: UIColor, buttonTextTitle title: String, buttonIconImage iconImage: String) -> UIButton {
        
        // In the below we are creating a UIButton object and assign it to the bottom variable:
        
        let newButton = UIButton(type: .system)
        
        // In the below we are adding a frame to this Variable by creating a CGRect using the values we have dfined earlier on:
        
        newButton.frame = CGRect(x: xCoordinate, y: yCoordinate, width: width, height: height)
        
        newButton.backgroundColor = colour
        
        newButton.layer.cornerRadius = radius
        
        newButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: fontSize)
        
        newButton.setTitleColor(normalTextColour, for: .normal)
        
        newButton.setTitleColor(highlightedTextColour, for: .highlighted)
        
        newButton.setTitle(title, for: .normal)
        
        newButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        
        newButton.center.x = self.view.center.x
        
        if let newFileButtonImage = UIImage(named: iconImage) {
            
            newButton.setImage(newFileButtonImage, for: .normal)
            
        }
        
        self.view.addSubview(newButton)

        return newButton
        
    }
    
    @objc func newFileButtonPressed(sender : UIButton) {
        
        sender.tag = 1
        
//        let alert = UIAlertController(title: "Clicked", message: "You have clicked on the button", preferredStyle: .alert)
//
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func openFileButtonPressed(sender : UIButton) {
    
        sender.tag = 2

    }
    
    @objc func documentationButtonPressed(sender : UIButton) {
        
        sender.tag = 3
        
    }
    
    @objc func emailUsButtonPressed(sender : UIButton) {
        
        sender.tag = 4
        
    }

    @objc func xyPressed(sender : UIButton) {
        
        xy.shake()
        
    }
    
}
