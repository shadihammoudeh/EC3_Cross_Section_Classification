//
//  ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 05/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    @IBOutlet weak var newFileButton: UIButton!
    
    @IBOutlet weak var openFileButton: UIButton!
    
    @IBOutlet weak var documentationButton: UIButton!
    
    @IBOutlet weak var emailUsButton: UIButton!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    let differentIphoneModels: [String] = ["iPhoneXsMax&XR", "iPhoneX&Xs", "iPhone6Plus,6sPlus,7Plus&8Plus", "iPhone6,6s,7&8", "iPhone5,5s,5c&SE"]
    
    let backgroundImageHeightForDifferentiPhonesScreens: [CGFloat] = [774, 690, 672, 603, 504]
    
    override func viewWillAppear(_ animated: Bool) {
        
        // The below Array has been created for all buttons in this ViewController in order to affect the layout of all of them when the modifyButtonsLayout Method is called later on:
        
        let  buttonsArray = [newFileButton, openFileButton, documentationButton, emailUsButton]
        
        // The below code loops through every UIButton included in the buttonsArray and then pass the UIBUtton into the modifyButtonsLayout Method in order to alter its layout as desired:
        
        for button in buttonsArray {
            
            modifyButtonsLayout(buttonName: button!)
            
        }
        
        let currentBackgroundImageHeight = backgroundImage.frame.height
        
        modifyButtonsConstraints(backgroundImageHeight: currentBackgroundImageHeight)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
    }

    // The below Method modifies the layout of all buttons on this ViewController:
    
    func modifyButtonsLayout(buttonName: UIButton) {
        
        buttonName.layer.cornerRadius = 20 // This line of code is needed in order to introduce corners to the button boarders rather than having them at 90 degrees angles.
        
        buttonName.showsTouchWhenHighlighted = true // This line of code make the button icon glow whenever the user press on the button.
        
        buttonName.setTitleColor(UIColor .white, for: UIControl.State.highlighted) // This line of code changes the text inside the button to white whenever the user click on it.
        
        buttonName.translatesAutoresizingMaskIntoConstraints = false // This line of code is needed in order to enable all the constraints that we are going to apply later on to the UIButton elements.
        
        
    }
    
    // The below Method sets the constraints required for each button depending on the iPhone screen size the user is using:
    
    func modifyButtonsConstraints(backgroundImageHeight: CGFloat) {
        
        if Int(backgroundImageHeight) == 774 { // 774 points corresponds to iPhone Xs Max screen size:
            
            let newFileButtonTopConstraintToTopOfBackgroundImage: CGFloat = 100
            
            let emailUsButtonBottomConstraintToBottomOfBackgroundImage: CGFloat = -100
            
            let openButtonConstraintAndDocumentationButtonConstraint: Int = (Int(backgroundImageHeight) - Int(newFileButtonTopConstraintToTopOfBackgroundImage) + Int(emailUsButtonBottomConstraintToBottomOfBackgroundImage) - 256)/3
            
            newFileButton.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: newFileButtonTopConstraintToTopOfBackgroundImage).isActive = true
            
            emailUsButton.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: emailUsButtonBottomConstraintToBottomOfBackgroundImage).isActive = true
            
            openFileButton.topAnchor.constraint(equalTo: newFileButton.bottomAnchor, constant: CGFloat(openButtonConstraintAndDocumentationButtonConstraint)).isActive = true
            
            documentationButton.topAnchor.constraint(equalTo: openFileButton.bottomAnchor, constant: CGFloat(openButtonConstraintAndDocumentationButtonConstraint)).isActive = true
            
        } else { // For all other iPhones:
            
            let newFileButtonTopConstraintToTopOfBackgroundImage: Int = 100 - ((774 - Int(backgroundImageHeight))/5)
            
            let emailUsButtonBottomConstraintToBottomOfBackgroundImage: Int = -100 + ((774 - Int(backgroundImageHeight))/5)
            
            let openButtonConstraintAndDocumentationButtonConstraint: Int = (Int(backgroundImageHeight) - Int(newFileButtonTopConstraintToTopOfBackgroundImage) + Int(emailUsButtonBottomConstraintToBottomOfBackgroundImage) - 256)/3
            
            newFileButton.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: CGFloat(newFileButtonTopConstraintToTopOfBackgroundImage)).isActive = true
            
            emailUsButton.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: CGFloat(emailUsButtonBottomConstraintToBottomOfBackgroundImage)).isActive = true
            
            openFileButton.topAnchor.constraint(equalTo: newFileButton.bottomAnchor, constant: CGFloat(openButtonConstraintAndDocumentationButtonConstraint)).isActive = true
            
            documentationButton.topAnchor.constraint(equalTo: openFileButton.bottomAnchor, constant: CGFloat(openButtonConstraintAndDocumentationButtonConstraint)).isActive = true
            
        }
        
    }

}
