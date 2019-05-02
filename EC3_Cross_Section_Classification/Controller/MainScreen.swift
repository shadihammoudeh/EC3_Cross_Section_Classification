//
//  ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 05/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class MainScreen: UIViewController, UINavigationBarDelegate {
    
    // The below line of code connects the background image as an IBOutlet to this ViewController, in order to be able to apply constraints to it later on:
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // Thie below line of code creates an instance for the NavigationBar from the CustomNavigationBar.swift file:
    
    let navigationBar = CustomNavigationBar(navigationBarTitle: "Classification of Cross Sections to Eurocode 3", navigationBarIsTranslucent: true)

    // The only input that is hard-coded in the below Buttons Instances which are created from the CustomButton.swift file is buttonTag:
    
    let newFileButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["newFileButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["newFileButtonIcon"]!, buttonTag: 1, buttonHeight: ButtonsAndIphonesData().buttonHeight["newFileButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["newFileButton"]!, buttonSelector: #selector(buttonPressed(sender:)), buttonTarget: self)

    let openButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["openFileButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["openFileButtonIcon"]!, buttonTag: 2, buttonHeight: ButtonsAndIphonesData().buttonHeight["openFileButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["openFileButton"]!, buttonSelector: #selector(buttonPressed(sender:)), buttonTarget: self)

    let documentationButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["documentationButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["documentationButtonIcon"]!, buttonTag: 3, buttonHeight: ButtonsAndIphonesData().buttonHeight["documentationButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["documentationButton"]!, buttonSelector: #selector(buttonPressed(sender:)), buttonTarget: self)

    let emailUsButton = CustomButton(buttonTitle: ButtonsAndIphonesData().buttonTitle["emailUsButtonTitle"]!, buttonIconImage: ButtonsAndIphonesData().buttonIconImage["emailUsButtonIcon"]!, buttonTag: 4, buttonHeight: ButtonsAndIphonesData().buttonHeight["emailUsButton"]!, buttonWidth: ButtonsAndIphonesData().buttonWidth["emailUsButton"]!, buttonSelector: #selector(buttonPressed(sender:)), buttonTarget: self)
    
    
    // The viewDidLayoutSubviews() gets called to notify the view controller that its view has just laid out its subviews:
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        // The below lines of code calculate the top and bottom height of the safeAreaInsets, which need to be substracted from the total screen height in order to get the remaining total height of the safeArea.
        // When the bounds change for a view controller's view, the view adjusts the positions of its subviews and then the system calls this method. However, this method being called does not indicate that the individual layouts of the view's subviews have been adjusted. Each subview is responsible for adjusting its own layout.
        // Your view controller can override this method to make changes after the view lays out its subviews. The default implementation of this method does nothing.
        
        var topSafeArea: CGFloat
        
        var bottomSafeArea: CGFloat
        
        if #available(iOS 11.0, *) {
            
            topSafeArea = view.safeAreaInsets.top
            
            bottomSafeArea = view.safeAreaInsets.bottom
            
        } else {
            
            topSafeArea = topLayoutGuide.length
            
            bottomSafeArea = bottomLayoutGuide.length
            
        }
        
        // This is the correct point to insert the below code in order to get the height of the navigation bar as well as spacings between buttons (i.e., after it has been added as a subview to this View Controller):
        
        let navigationBarHeight = navigationBar.frame.size.height // here we are printing the height of the NavigationBar.
        
        let totalIphoneScreenHeight = self.view.frame.size.height
        
        let totalIphoneScreenWidth = self.view.frame.size.width
        
        let safeAreaHeight = totalIphoneScreenHeight - topSafeArea - navigationBarHeight - bottomSafeArea // this is the total height that can be used to present our UIElements, which will not be obstructed by any other thing.
        
        let spacingsBetweenButtons = (safeAreaHeight - ButtonsAndIphonesData().buttonHeight["newFileButton"]! - ButtonsAndIphonesData().buttonHeight["openFileButton"]! - ButtonsAndIphonesData().buttonHeight["documentationButton"]! - ButtonsAndIphonesData().buttonHeight["emailUsButton"]!) / 5 // Here we are calculating the equal spacings between buttons from the bottom of the navigation bar to the top of the bottom safeArea.
        
        // Below we are applying the needed top and bottom constraints to our buttons, the reason we are applying the constraints here not inside the function is to be able to access the spacingBetweenButtons constant:
        
        newFileButton.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: spacingsBetweenButtons).isActive = true

        openButton.topAnchor.constraint(equalTo: newFileButton.bottomAnchor, constant: spacingsBetweenButtons).isActive = true

        documentationButton.topAnchor.constraint(equalTo: openButton.bottomAnchor, constant: spacingsBetweenButtons).isActive = true

        emailUsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: (-1*spacingsBetweenButtons)).isActive = true
        
        // safe area values are now available to use
    
    }
    
    // viewDidLoad() Method gets called after loading the view. Thus, any UI related changes should be done inside it:
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // The below line of code sets this ViewController as the delegate for the navigationBar instance which have been created from the CustomNavigationBar class:
        
        navigationBar.delegate = self
        
        // The below line of code adds the navigationBar as well as the custom buttons as subviews to this current ViewController:
        
        view.addSubview(navigationBar)
        
        view.addSubview(newFileButton)

        view.addSubview(openButton)

        view.addSubview(documentationButton)

        view.addSubview(emailUsButton)
        
        // The below Method gets called to setup the needed constraints for the NavigationBar, backgroundImage, and the Buttons:
        
        setupConstraints()
        
    }
    
    @objc func buttonPressed(sender : UIButton) {
        
        if sender.tag == 1 {
            
            newFileButton.shake() // This implements the shake function to the button.
            
            // The below line of code displays the next ViewController to be displayed whenever the user presses this button:
            
            guard let nextViewControllerToGoTo = storyboard?.instantiateViewController(withIdentifier: "NewFileButtonPressedTabController") else {
                
                print("NewFileButtonPressedTabController could not be presented")
                
                return
                
            }
            
            present(nextViewControllerToGoTo, animated: true, completion: nil)
            
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
    
    func setupConstraints() {
        
        // The below line of code is needed in order to enable constraints to be added via code to the backgroundImage:
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        // The below lines of code set the constraints related to the backgroundImage:
        
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        // The below lines of code set the constraints related to the Navigation Bar:

        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

        if #available(iOS 11, *) {

            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true

        } else {

            navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

        }
        
        // The below lines of code defines some of the constraints for the UIButtons:
        
        newFileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        documentationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        emailUsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    // The below functionis needed in order to get rid of the gap between the NavigationBar and the Status Bar:
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {

        return UIBarPosition.topAttached

    }
    
}

