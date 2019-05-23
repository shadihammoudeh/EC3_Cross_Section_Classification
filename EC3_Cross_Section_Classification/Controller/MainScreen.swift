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
    
    lazy var customNavigationBar = CustomNavigationBar(labelTitleText: "Cross-Section Classification to Eurocode 3", labelTitleTextColour: .white, labelTitleFontSize: 18, labelTitleFontType: "Apple SD Gothic Neo", viewNavigationBarWillBeAddedTo: self.view, navigationBarDelegate: self, isNavigationBarTranslucent: false, navigationBarBarStyle: .default, navigationBarBarTintColourHexCode: "#030806")
    
    lazy var newFileButton = CustomButton(viewButtonWillBeAddedTo: self.view, buttonTitleTexForNormalState: "New File...", buttonTitleTextColourForNormalState: .black, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonBackgroundHexColourCode: "#B24B32", buttonFrameCornerRadius: 25, buttonFrameBorderWidth: 2, buttonFrameBorderColour: "#7AFFD2", buttonBackgroundTransperancyAlphaValue: 0.75, buttonTagNumber: 1, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "newFileButtonIcon")
    
    lazy var openButton = CustomButton(viewButtonWillBeAddedTo: self.view, buttonTitleTexForNormalState: "Open", buttonTitleTextColourForNormalState: .black, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonBackgroundHexColourCode: "#B24B32", buttonFrameCornerRadius: 25, buttonFrameBorderWidth: 2, buttonFrameBorderColour: "#7AFFD2", buttonBackgroundTransperancyAlphaValue: 0.75, buttonTagNumber: 2, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "openFileButtonIcon")
    
    lazy var documentationButton = CustomButton(viewButtonWillBeAddedTo: self.view, buttonTitleTexForNormalState: "Documentation", buttonTitleTextColourForNormalState: .black, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonBackgroundHexColourCode: "#B24B32", buttonFrameCornerRadius: 25, buttonFrameBorderWidth: 2, buttonFrameBorderColour: "#7AFFD2", buttonBackgroundTransperancyAlphaValue: 0.75, buttonTagNumber: 3, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "documentationIcon")
    
    lazy var contactUsButton = CustomButton(viewButtonWillBeAddedTo: self.view, buttonTitleTexForNormalState: "Contact Us", buttonTitleTextColourForNormalState: .black, buttonTitleTextColourForHighlightedState: .blue, buttonTitleFontType: "Apple SD Gothic Neo", buttonTitleFontSize: 17, buttonBackgroundHexColourCode: "#B24B32", buttonFrameCornerRadius: 25, buttonFrameBorderWidth: 2, buttonFrameBorderColour: "#7AFFD2", buttonBackgroundTransperancyAlphaValue: 0.75, buttonTagNumber: 4, buttonTarget: self, buttonSelector: #selector(buttonPressed(sender:)), buttonImageForNormalState: "emailUsIcon")
    
    // The viewDidLayoutSubviews() gets called to notify the view controller that its view has just laid out its subviews:
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        print("viewDidLayoutSubviews")
    
        let statusBarPlusNavigationBarHeight = customNavigationBar.frame.size.height + UIApplication.shared.statusBarFrame.size.height
        
        let totalScreenHeightInculdingSafeAreaGuidlines = view.frame.size.height
        
        let bottomViewSafeAreaGuidlineHeight = view.safeAreaInsets.bottom
        
        let totalScreenSafeAreaHeight = totalScreenHeightInculdingSafeAreaGuidlines - statusBarPlusNavigationBarHeight - bottomViewSafeAreaGuidlineHeight
        
        let verticalSpacingBetweenButtons = (totalScreenSafeAreaHeight - newFileButton.frame.height - openButton.frame.height - documentationButton.frame.height - contactUsButton.frame.height) / 5
        
        setupConstraints(verticalButtonsSpacings: verticalSpacingBetweenButtons)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("viewDidLoad")
        
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
            
            openButton.shake()
            
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
            
            newFileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            openButton.topAnchor.constraint(equalTo: newFileButton.bottomAnchor, constant: verticalSpacings),
            
            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            documentationButton.topAnchor.constraint(equalTo: openButton.bottomAnchor, constant: verticalSpacings),
            
            documentationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            contactUsButton.topAnchor.constraint(equalTo: documentationButton.bottomAnchor, constant: verticalSpacings),
            
            contactUsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            ])
        
    }
    
    // The below functionis needed in order to get rid of the gap between the NavigationBar and the Status Bar:
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {

        return UIBarPosition.topAttached

    }
    
}

