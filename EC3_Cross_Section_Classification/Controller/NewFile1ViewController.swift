//
//  NewFile1ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 14/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class NewFile1ViewController: UIViewController, UINavigationBarDelegate {
    
    let navigationBar = CustomNavigationBar(navigationBarTitle: "Hello", leftBarButtonTarget: self, leftBarButtonSelector: #selector((buttonPressed(sender:))))

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationBar.delegate = self
        
        view.addSubview(navigationBar)
        
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
        
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        
        return UIBarPosition.topAttached
        
    }

}
