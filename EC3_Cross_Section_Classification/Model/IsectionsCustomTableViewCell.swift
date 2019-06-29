//
//  CustomTableViewCell.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 09/05/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class IsectionsCustomTableViewCell: UITableViewCell {
    
    // Below we are going to define the properties for each I section that we would like to display inside our TableView.
    
    var fullSectionDesignation: String?
    
    var sectionDepth: Double?
    
    var sectionWidth: Double?
    
    var sectionWebThickness: Double?
    
    var sectionFlangeThickness: Double?
    
    var sectionMassPerMetre: Double?
    
    var sectionDesignationLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    var sectionDepthLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    var sectionWidthLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    var sectionWebThicknessLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    var sectionFlangeThicknessLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    var sectionMassPerMetreLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    // When you register or call this table view cell later it is going to go ahead and call this initialiser for you and this is where we are going to set out our constraints:
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(sectionDesignationLabel)
        
        self.addSubview(sectionDepthLabel)
        
        self.addSubview(sectionWidthLabel)
        
        self.addSubview(sectionFlangeThicknessLabel)
        
        self.addSubview(sectionWebThicknessLabel)
        
        self.addSubview(sectionMassPerMetreLabel)
        
        sectionDesignationLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        sectionDesignationLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        sectionDesignationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        sectionDesignationLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    // Now that we have setup the views as illustrated in the above line of codes we need to provide the needed information to be displayed inside the view that we created above. We cannot provide the information in the initializer as the information about the views is not initially provided, thus, we need to add them after the initializer. Thus we need to provide this in our layoutSubViews:
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // The below is needed in order to check that the optional variables we defined at the beginning of this Class are not empty (this is called Optional Binding):
        
        if let sectionDesignation = fullSectionDesignation {
            
            sectionDesignationLabel.text = sectionDesignation
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
