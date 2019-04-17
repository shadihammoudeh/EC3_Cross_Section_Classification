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
        
        let openRolledSectionsViewController = OpenRolledSections()
        
        let opeRolledSectionsBarItem = UITabBarItem(title: "Tab1", image: UIImage(named: "newFileButtonIcon"), selectedImage: UIImage(named: "newFileButtonIcon"))
        
        openRolledSectionsViewController.tabBarItem = opeRolledSectionsBarItem
        
        let structuralHollowSectionsViewController = StructuralHollowSections()
        
        let structuralHollowSectionsBarItem = UITabBarItem(title: "Tab2", image: UIImage(named: "newFileButtonIcon"), selectedImage: UIImage(named: "newFileButtonIcon"))
        
        structuralHollowSectionsViewController.tabBarItem = structuralHollowSectionsBarItem
        
        setItems([opeRolledSectionsBarItem, structuralHollowSectionsBarItem], animated: true)
        
        isTranslucent = true
        
        backgroundColor = .black
        
        barStyle = .black
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
