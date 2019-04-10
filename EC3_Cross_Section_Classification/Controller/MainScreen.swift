//
//  ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 05/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    // The only input that are hard-coded in the below Buttons Instances is buttonTag:
    
    let newFileButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["newFileButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["newFileButtonIcon"]!, buttonTag: 1, buttonHeight: ButtonsAndIphonesData().buttonHeight["newFileButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["newFileButton"]!)
    
    let newFileButtonTopConstraint: CGFloat = 100
    
    let openButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["openFileButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["openFileButtonIcon"]!, buttonTag: 2, buttonHeight: ButtonsAndIphonesData().buttonHeight["openFileButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["openFileButton"]!)
    
   let documentationButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["documentationButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["documentationButtonIcon"]!, buttonTag: 3, buttonHeight: ButtonsAndIphonesData().buttonHeight["documentationButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["documentationButton"]!)
    
     let emailUsButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["emailUsButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["emailUsButtonIcon"]!, buttonTag: 4, buttonHeight: ButtonsAndIphonesData().buttonHeight["emailUsButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["emailUsButton"]!)
    
    // viewDidLoad() Method gets called after loading the view. Thus, any UI related changes should be done inside it:
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let emailUsButtonBottomConstraint: CGFloat = -100
        
        let window = UIApplication.shared.keyWindow
        
        let topPadding = window?.safeAreaInsets.top
        
        let bottomPadding = window?.safeAreaInsets.bottom
        
        let totalIphoneScreenHeight = self.view.frame.size.height
        
        let navigationBarHeight = self.navigationController?.navigationBar.frame.size.height
        
        let userIphoneScreenSafeAreaHeight = totalIphoneScreenHeight - topPadding! - bottomPadding! - navigationBarHeight!
        
        let spacingBetweenButtons: CGFloat = (userIphoneScreenSafeAreaHeight - newFileButtonTopConstraint - (-1*emailUsButtonBottomConstraint) - ButtonsAndIphonesData().buttonHeight["newFileButton"]! - ButtonsAndIphonesData().buttonHeight["openFileButton"]! - ButtonsAndIphonesData().buttonHeight["documentationButton"]! - ButtonsAndIphonesData().buttonHeight["emailUsButton"]!) / 3
        
        view.addSubview(newFileButton)
        
        view.addSubview(openButton)
        
        view.addSubview(documentationButton)
        
        view.addSubview(emailUsButton)
        
        newFileButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        openButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        documentationButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        emailUsButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        newFileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        documentationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        emailUsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let userIphoneScreenHeight = view.frame.size.height
        
        if userIphoneScreenHeight == ButtonsAndIphonesData().differentIphoneScreens["iPhoneXsMax,XR"] {
            
            newFileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: newFileButtonTopConstraint).isActive = true
            
            openButton.topAnchor.constraint(equalTo: newFileButton.bottomAnchor, constant: spacingBetweenButtons).isActive = true
            
            documentationButton.topAnchor.constraint(equalTo: openButton.bottomAnchor, constant: spacingBetweenButtons).isActive = true
            
            emailUsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: emailUsButtonBottomConstraint).isActive = true
            
        }
        

        
    }
    
    @objc func buttonPressed(sender : UIButton) {
        
        if sender.tag == 1 {
            
            print("button 1 has been pressed")
            
            newFileButton.shake()
            
        } else if sender.tag == 2 {
            
            print("button 2 has been pressed")
            
            openButton.shake()
            
        } else if sender.tag == 3 {
            
            print("button 3 has been pressed")
            
            documentationButton.shake()
            
        } else if sender.tag == 4 {
            
            print("button 4 has been pressed")
            
            emailUsButton.shake()
            
        }

        
    }
    
}
