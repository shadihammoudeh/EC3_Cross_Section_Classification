//
//  NewFile1ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 14/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class NewFileButtonPressedTabController: UITabBarController, UINavigationBarDelegate {
    
    let navigationBar = CustomNavigationBar(navigationBarTitle: "'Blue Book' Catalogue Sections", leftBarButtonTarget: self, leftBarButtonSelector: #selector(buttonPressed(sender:)))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationBar.delegate = self
        
        view.addSubview(navigationBar)
        
        let firstViewControllerInTabBar = FirstItemInTabBarOpenRolledSections()
        
        // The below lines of code add required images for the normal and selected state for the first tabBarItem:
        
        firstViewControllerInTabBar.tabBarItem.image = UIImage(named: "notSelectedStateOpenSections")?.withRenderingMode(.alwaysOriginal)
        
        firstViewControllerInTabBar.tabBarItem.selectedImage = UIImage(named: "selectedOpenSections")?.withRenderingMode(.alwaysOriginal)
        
        // The below line of code sets the title for the first tabBarItem:
        
        firstViewControllerInTabBar.tabBarItem.title = "Hot Rolled Structural Steel"
        
        // The below line of code sets the text colour of UIBarItem in normal state (i.e., when not selected):
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:.normal)
        
        // The below line of code sets the text colour of UIBarItem in selected state (i.e., when selected):
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.yellow], for:.selected)
        
        firstViewControllerInTabBar.tabBarItem.tag = 0
        
        let secondViewControllerInTabBar = SecondItemInTabBarHollowStructuralSections()
        
        secondViewControllerInTabBar.tabBarItem.image = UIImage(named: "notSelectedHollowSections")?.withRenderingMode(.alwaysOriginal)
        
        secondViewControllerInTabBar.tabBarItem.selectedImage = UIImage(named: "selectedHollowSections")?.withRenderingMode(.alwaysOriginal)

        secondViewControllerInTabBar.tabBarItem.title = "Structural Hollow Sections"
        
        secondViewControllerInTabBar.tabBarItem.tag = 1
        
        let tabBarList = [firstViewControllerInTabBar, secondViewControllerInTabBar]
        
        viewControllers = tabBarList
        
//        firstViewControllerInTabBar.tabBarItem.image = UIImage(named: "iconfinder_aluminum_steel_1572637")
        
        setupConstraints()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let navigationBarHeight = navigationBar.frame.size.height

        print(navigationBarHeight)
        
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
    
    @objc func buttonPressed
        
        (sender : UIButton) {
        
        print("button pressed")
        
        guard let previousViewControllerToGoTo = storyboard?.instantiateViewController(withIdentifier: "MainScreen") else {
            
            print("MainScreen could not be presented")
            
            return
            
        }
        
        present(previousViewControllerToGoTo, animated: false, completion: nil)
        
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        
        return UIBarPosition.topAttached
        
    }

}
