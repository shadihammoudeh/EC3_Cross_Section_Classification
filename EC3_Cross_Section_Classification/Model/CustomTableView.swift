//
//  CustomTableView.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 6/21/19.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        
        super.init(frame: frame, style: style)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    convenience init(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, tableViewHostView: UIView, tableViewCustomCellClassToBeRegistered: AnyClass?, tableViewCustomCellReuseIdentifierToBeRegistered: String, tableViewTopAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, tableViewBottomAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        
        self.init()
        
        setupEssentialTableViewProperties(tableViewDelegate: tableViewDelegate, tableViewDataSource: tableViewDataSource, hostView: tableViewHostView, tableViewCellClassToBeRegistered: tableViewCustomCellClassToBeRegistered, tableViewCellReuseIdentifierToBeRegistered: tableViewCustomCellReuseIdentifierToBeRegistered)
        
        setupConstraints(hostView: tableViewHostView, topAnchorConstraint: tableViewTopAnchor, bottomAnchorConstraint: tableViewBottomAnchor)
        
    }
    
    func setupEssentialTableViewProperties(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, hostView: UIView, tableViewCellClassToBeRegistered cellClassRegister: AnyClass?, tableViewCellReuseIdentifierToBeRegistered forCelReuseIdentifierRegister: String) {
        
        backgroundColor = UIColor.green
        
        delegate = tableViewDelegate
        
        dataSource = tableViewDataSource

        separatorColor = UIColor.brown
        
        // Since we are defining the whole TableView programmatically rather than using Storyboards, we need to register the custom cell we would like to use for our custom table before we can use it:
        
        register(cellClassRegister.self, forCellReuseIdentifier: forCelReuseIdentifierRegister)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        hostView.addSubview(self)
        
    }
    
    func setupConstraints(hostView: UIView, topAnchorConstraint: NSLayoutAnchor<NSLayoutYAxisAnchor>, bottomAnchorConstraint: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        
        NSLayoutConstraint.activate([
        
            leftAnchor.constraint(equalTo: hostView.leftAnchor),
            
            rightAnchor.constraint(equalTo: hostView.rightAnchor),
            
            topAnchor.constraint(equalTo: topAnchorConstraint),
            
            bottomAnchor.constraint(equalTo: bottomAnchorConstraint)
        
        ])
        
    }
    
}
