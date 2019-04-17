//
//  NewFile1ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 14/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class NewFile1ViewController: UIViewController, UINavigationBarDelegate, UITabBarDelegate {
    
    let navigationBar = CustomNavigationBar(navigationBarTitle: "'Blue Book' Catalogue Sections", leftBarButtonTarget: self, leftBarButtonSelector: #selector(buttonPressed(sender:)))
    
    let tabBar = CustomTabBar()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationBar.delegate = self
        
        tabBar.delegate = self
        
        view.addSubview(navigationBar)
        
        view.addSubview(tabBar)
        
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
        
        // The below code lines setup the needed constraints for the tabBar:
        
        tabBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tabBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        tabBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
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
