//
//  NewFile1ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 14/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

// The below class acts the TabBar Controller, and it is the view that appears immediately after the user presses on the New File button, this view manages what should get displayed when the user choose an option from the TabBar:

class NewFileButtonPressedTabController: UITabBarController, UINavigationBarDelegate {
    
    // Below we are creating an instance from the CustomNavigationBar.swift file:
    
    let navigationBar = CustomNavigationBar(navigationBarTitle: "'Blue Book' Catalogue Sections", leftBarButtonTarget: self, leftBarButtonSelector: #selector(buttonPressed(sender:)))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationBar.delegate = self
        
        view.addSubview(navigationBar)
        
        // The below lines of code create an instance for the first and second UITableViewController to be displayed in the TabBar:
        
        let firstViewControllerInTabBar = FirstItemInTabBarOpenRolledSections()
        
        let secondViewControllerInTabBar = SecondItemInTabBarHollowStructuralSections()
        
        // The below lines of code add required images for the normal and selected state for the first and second tabBarItem:
        
        firstViewControllerInTabBar.tabBarItem.image = UIImage(named: "notSelectedStateOpenSections")?.withRenderingMode(.alwaysOriginal)
        
        firstViewControllerInTabBar.tabBarItem.selectedImage = UIImage(named: "selectedOpenSections")?.withRenderingMode(.alwaysOriginal)
        
        secondViewControllerInTabBar.tabBarItem.image = UIImage(named: "notSelectedHollowSections")?.withRenderingMode(.alwaysOriginal)
        
        secondViewControllerInTabBar.tabBarItem.selectedImage = UIImage(named: "selectedHollowSections")?.withRenderingMode(.alwaysOriginal)
        
        // The below lines of code set the title for the first and second tabBarItem:
        
        firstViewControllerInTabBar.tabBarItem.title = "Hot Rolled Structural Steel"
        
        secondViewControllerInTabBar.tabBarItem.title = "Structural Hollow Sections"
        
        // The below line of code set the text colour of UIBarItems in normal state (i.e., when not selected):
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:.normal)
        
        // The below line of code sets the text colour of UIBarItems in selected state (i.e., when selected):
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.yellow], for:.selected)
        
        // The below line of codes define a tag number for each of the items to be added to the tabBar. So that they can be identified when pressed by the user:
        
        firstViewControllerInTabBar.tabBarItem.tag = 0
        
        secondViewControllerInTabBar.tabBarItem.tag = 1

        // The below line of code adds the first and second items to be displayed in our TabBar into an array:
        
        let tabBarList = [firstViewControllerInTabBar, secondViewControllerInTabBar]
        
        viewControllers = tabBarList
        
        // The below Method defines the needed constraints for the Navigation Bar:
        
        setupConstraints()
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
    }
    
    func setupConstraints() {
        
        // The below lines of code set the constraints related to the Navigation Bar:
        
        navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        if #available(iOS 11, *) {
            
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            
        } else {
            
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            
        }
        
    }
    
    // The below Method defines what should happen when the user presses on the Back button at the top left corner of the screen, in this case we would like to present the Main Screen back to the user upon pressing the button:
    
    @objc func buttonPressed
        
        (sender : UIButton) {
        
        print("button pressed")
        
        guard let previousViewControllerToGoTo = storyboard?.instantiateViewController(withIdentifier: "MainScreen") else {
            
            print("MainScreen could not be presented")
            
            return
            
        }
        
        present(previousViewControllerToGoTo, animated: false, completion: nil)
        
    }
    
    // The below Method is required in order to attach the custom Navigation Bar to the bottom of the status bar and make them appear as one entity:
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {

        return UIBarPosition.topAttached

    }

}
