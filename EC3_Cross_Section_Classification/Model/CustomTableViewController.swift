//
//  CustomTableViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 23/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    let cellId = "cellId"

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTableView()

    }
    
    func setupTableView() {
        
        // Registers a class for use in creating new table cells:
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 0
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
        
    }

}
