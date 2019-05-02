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
    
    convenience init(navigationBarTitle title: String, navigationBarIsTranslucent: Bool) {
        
        self.init()
        
        isTranslucent = navigationBarIsTranslucent
        
        let newNavigationBarItem = UINavigationItem()
        
        let navigationBarTitleLabel = UILabel()

        navigationBarTitleLabel.text = title
        
        navigationBarTitleLabel.textColor = .white
        
        newNavigationBarItem.titleView = navigationBarTitleLabel
        
        items = [newNavigationBarItem]

    }
    
    convenience init(navigationBarTitle title: String, leftBarButtonTarget target: Any?, leftBarButtonSelector selector: Selector, navigationBarIsTranslucent: Bool) {
        
        self.init()
        
        isTranslucent = navigationBarIsTranslucent
        
        let newNavigationBarItem = UINavigationItem()
        
        let navigationBarTitleLabel = UILabel()
        
        navigationBarTitleLabel.frame.size = CGSize(width: 100, height: 120)
        
        navigationBarTitleLabel.numberOfLines = 2
        
        navigationBarTitleLabel.text = title
        
        navigationBarTitleLabel.textColor = .white
        
        newNavigationBarItem.titleView = navigationBarTitleLabel
        
        let navigationBarBackButtonImage = UIImage(named: "backButton")
        
        navigationBarBackButtonImage?.withRenderingMode(.alwaysOriginal)
        
        let navigationBarLeftButton = UIBarButtonItem(image: navigationBarBackButtonImage, style: .plain, target: target, action: selector)
        
        newNavigationBarItem.leftBarButtonItem = navigationBarLeftButton
        
        items = [newNavigationBarItem]
        
    }
    
    func setupNavigationBar() {

        backgroundColor = .black
        
        barStyle = .blackTranslucent
        
        // The below line of code is basically instructing the title inside the Navigation Bar not to be Large:
        
        prefersLargeTitles = false
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
    
    

