//
//  CustomTabBar.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 17/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBar {
 
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupTabBar()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        setupTabBar()

    }

    func setupTabBar() {
        
        let firstItemInTabBar = FirstItemInTabBarOpenRolledSections()
        
        let opeRolledSectionsBarItem = UITabBarItem(title: "Open Rolled Sections", image: UIImage(named: "openRolledSections"), tag: 0)
        
        firstItemInTabBar.tabBarItem = opeRolledSectionsBarItem
        
        let structuralHollowSectionsViewController = SecondItemInTabBarHollowStructuralSections()
        
        let structuralHollowSectionsBarItem = UITabBarItem(title: "Structural Sections", image: UIImage(named: "openRolledSections"), tag: 1)
        
        structuralHollowSectionsViewController.tabBarItem = structuralHollowSectionsBarItem
        
        setItems([opeRolledSectionsBarItem, structuralHollowSectionsBarItem], animated: true)
        
        isTranslucent = true
        
        backgroundColor = .black
        
        barStyle = .black
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
