//
//  CustomNavigationBar.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 4/13/19.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

import ChameleonFramework

class CustomNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupNavigationBar()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        setupNavigationBar()
        
    }
    
    convenience init(navigationBarTitle title: String) {
        
        self.init()
        
        let newNavigationBarItem = UINavigationItem()
        
        let navigationBarTitleLabel = UILabel()

        navigationBarTitleLabel.text = title
        
        navigationBarTitleLabel.textColor = .white
        
        newNavigationBarItem.titleView = navigationBarTitleLabel
        
        items = [newNavigationBarItem]

    }
    
    convenience init(navigationBarTitle title: String, leftBarButtonTarget target: Any?, leftBarButtonSelector selector: Selector) {
        
        self.init()
        
        let newNavigationBarItem = UINavigationItem()
        
        let navigationBarTitleLabel = UILabel()
        
        navigationBarTitleLabel.text = title
        
        navigationBarTitleLabel.textColor = .white
        
        newNavigationBarItem.titleView = navigationBarTitleLabel
        
        var navigationBarLeftButton = newNavigationBarItem.leftBarButtonItem
        
        navigationBarLeftButton = UIBarButtonItem(barButtonSystemItem: .action, target: target, action: selector)
        
        navigationBarLeftButton?.title = "Back"
        
        newNavigationBarItem.leftBarButtonItem = navigationBarLeftButton
        
        
        items = [newNavigationBarItem]
        
    }
    
    func setupNavigationBar() {
        
        isTranslucent = true
        
        backgroundColor = .black
        
        barStyle = .blackTranslucent
        
        // The below line of code is basically instructing the title inside the Navigation Bar not to be Large:
        
        prefersLargeTitles = false
        
        // The below line of codes add the title as an item to the NavigationBar:
        
//        let newNavigationBarItem = UINavigationItem()
//
//        let navigationBarTitleLabel = UILabel()
        
//        navigationBarTitleLabel.text = "Eurocodes 3 Cross-Section Classification"
        
//        navigationBarTitleLabel.textColor = .white
        
        // The below line of code adds the TitleLabel as an item to the NavigationBar:
        
//        newNavigationBarItem.titleView = navigationBarTitleLabel
//
//        items = [newNavigationBarItem]
        
        // The below line of code is needed in order to allow the activation of the constraints later on:
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
    
    

