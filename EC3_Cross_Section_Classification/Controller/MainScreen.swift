//
//  ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 05/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

import ChameleonFramework

class MainScreen: UIViewController, UINavigationBarDelegate {
    
    // The below line of code connects the background image as an IBOutlet to this ViewController, in order to be able to apply constraints to it later on:
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    lazy var customNavigationBar = CustomNavigationBar(labelTitleText: "Cross-Section Classification to Eurocode 3 (BS EN 1993-1-1:2005)", labelTitleTextColour: .white, labelTitleFontSize: 18, labelTitleFontType: "Apple SD Gothic Neo", viewNavigationBarWillBeAddedTo: self.view, navigationBarDelegate: self, isNavigationBarTranslucent: false, navigationBarBarStyle: .default, navigationBarBarTintColourHexCode: "#030806")
    
    var newFileButton = CustomButton(buttonTitleTexForNormalState: "New...", buttonTitleTextColourForNormalState: .white, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonTagNumber: 1, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "New File")
    
    var openFileButton = CustomButton(buttonTitleTexForNormalState: "Open...", buttonTitleTextColourForNormalState: .white, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonTagNumber: 2, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "Open File")
    
    var documentationButton = CustomButton(buttonTitleTexForNormalState: "Documentation", buttonTitleTextColourForNormalState: .white, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonTagNumber: 3, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "Documentation")
    
    var contactUsButton = CustomButton(buttonTitleTexForNormalState: "Contact Us", buttonTitleTextColourForNormalState: .white, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonTagNumber: 4, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "Contact Us")
    
    // The viewDidLayoutSubviews() gets called to notify the view controller that its view has just laid out its subviews:
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews")
        
        newFileButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        openFileButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)

        documentationButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)

        contactUsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        openFileButton.frame.size.width = 115
        
        documentationButton.frame.size.width = 170
        
        contactUsButton.frame.size.width = 145
        
        let statusBarPlusNavigationBarHeight = customNavigationBar.frame.size.height + UIApplication.shared.statusBarFrame.size.height
        
        let totalScreenHeightInculdingSafeAreaGuidlines = view.frame.size.height
        
        let bottomViewSafeAreaGuidlineHeight = view.safeAreaInsets.bottom
        
        let totalScreenSafeAreaHeight = totalScreenHeightInculdingSafeAreaGuidlines - statusBarPlusNavigationBarHeight - bottomViewSafeAreaGuidlineHeight
        
        let verticalSpacingBetweenButtons = (totalScreenSafeAreaHeight - newFileButton.frame.height - openFileButton.frame.height - documentationButton.frame.height - contactUsButton.frame.height) / 5
        
        setupConstraints(verticalButtonsSpacings: verticalSpacingBetweenButtons)

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        view.addSubview(newFileButton)
        
        view.addSubview(openFileButton)
        
        view.addSubview(documentationButton)
        
        view.addSubview(contactUsButton)
        
    }
    
    @objc func buttonPressed(sender : UIButton) {
        
        if sender.tag == 1 {
            
            // The below line of code displays the next ViewController to be displayed whenever the user presses this button:
            
            newFileButton.shake()
            
            guard let nextViewControllerToGoTo = storyboard?.instantiateViewController(withIdentifier: "NewFileButtonPressedTabController") else {
                
                print("NewFileButtonPressedTabController could not be presented")
                
                return
                
            }
            
            present(nextViewControllerToGoTo, animated: true, completion: nil)
            
        } else if sender.tag == 2 {
            
            openFileButton.shake()
            
            print("button 2 has been pressed")
            
        } else if sender.tag == 3 {
            
            documentationButton.shake()
            
            print("button 3 has been pressed")
            
        } else if sender.tag == 4 {
            
            contactUsButton.shake()
            
            print("button 4 has been pressed")
                        
        }

    }
    
    func setupConstraints(verticalButtonsSpacings verticalSpacings: CGFloat) {
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            newFileButton.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: verticalSpacings),
            
            newFileButton.leftAnchor.constraint(equalTo: documentationButton.leftAnchor),
            
            openFileButton.topAnchor.constraint(equalTo: newFileButton.bottomAnchor, constant: verticalSpacings),
            
            openFileButton.leftAnchor.constraint(equalTo: documentationButton.leftAnchor),
            
            documentationButton.topAnchor.constraint(equalTo: openFileButton.bottomAnchor, constant: verticalSpacings),
            
            documentationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            contactUsButton.topAnchor.constraint(equalTo: documentationButton.bottomAnchor, constant: verticalSpacings),
            
            contactUsButton.leftAnchor.constraint(equalTo: documentationButton.leftAnchor)
            
            
            ])
        
    }
    
    // The below functionis needed in order to get rid of the gap between the NavigationBar and the Status Bar:
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {

        return UIBarPosition.topAttached

    }
    
}

