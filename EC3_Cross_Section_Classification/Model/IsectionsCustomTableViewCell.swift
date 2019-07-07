//
//  CustomTableViewCell.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 09/05/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

import ChameleonFramework

class IsectionsCustomTableViewCell: UITableViewCell {
    
    var sectionDesignationLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .left
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(hexString: "#F27E63")
        
        return label
        
    }()
    
    var depthOfSectionLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(hexString: "#F27E63")
        
        return label
        
    }()
    
    var widthOfSectionLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(hexString: "#F27E63")
        
        return label
        
    }()
    
    var sectionWebThicknessLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(hexString: "#F27E63")
        
        return label
        
    }()
    
    var sectionFlangeThicknessLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(hexString: "#F27E63")

        return label
        
    }()
    
    var sectionMassPerMetreLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = UIColor(hexString: "#F27E63")

        return label
        
    }()
    
    // When you register or call this table view cell later it is going to go ahead and call this initialiser for you and this is where we are going to set out our constraints:
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(sectionDesignationLabel)
        
        addSubview(depthOfSectionLabel)
        
        addSubview(widthOfSectionLabel)
        
        addSubview(sectionWebThicknessLabel)
        
        addSubview(sectionFlangeThicknessLabel)
        
        applyAppropriateSizeAndConstraintsForCellItems()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func applyAppropriateSizeAndConstraintsForCellItems() {
        
        
        NSLayoutConstraint.activate([
            
            sectionDesignationLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            sectionDesignationLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            sectionDesignationLabel.topAnchor.constraint(equalTo: self.topAnchor),
            
            depthOfSectionLabel.topAnchor.constraint(equalTo: sectionDesignationLabel.bottomAnchor),
            
            depthOfSectionLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            widthOfSectionLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            widthOfSectionLabel.topAnchor.constraint(equalTo: sectionDesignationLabel.bottomAnchor),
            
            sectionWebThicknessLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            sectionWebThicknessLabel.topAnchor.constraint(equalTo: depthOfSectionLabel.bottomAnchor),
            
            sectionFlangeThicknessLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            sectionFlangeThicknessLabel.topAnchor.constraint(equalTo: widthOfSectionLabel.bottomAnchor)
            
            ])
        
    }
    
    // The below function is needed in order to calculate the height of the cellLabel height based on its contents. Then this height is used to calulate the needed constraints for the cellLabel and cellImage:
    
    func autoLabelHeight(cellTitleTextSize textSize: CGFloat, cellTitleFontType fontType: String, cellTitle title: String) -> CGFloat {
        
        var currentHeight: CGFloat!
        
        let cellTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        
        cellTitle.text = title
        
        cellTitle.font = UIFont(name: fontType, size: textSize)
        
        cellTitle.numberOfLines = 0
        
        cellTitle.sizeToFit()
        
        cellTitle.lineBreakMode = .byWordWrapping
        
        currentHeight = cellTitle.frame.height
        
        cellTitle.removeFromSuperview()
        
        return currentHeight
        
    }
    
    
}
