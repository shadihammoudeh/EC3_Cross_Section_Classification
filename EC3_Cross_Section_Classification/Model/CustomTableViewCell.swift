//
//  CustomTableViewCell.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 09/05/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // The lazy word below is used in order to be able to aaccess the View even though the below Property is declared before the viewDidLoad(). Lazy means, initialise this Property only when it is needed:
    
    lazy var backView: UIView = {
        
       let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 110))
        
        view.backgroundColor = UIColor.white
        
        return view
        
    }()

    lazy var userImage: UIImageView = {
        
        let userImage = UIImageView(frame: CGRect(x: 4, y: 6, width: 108, height: 108))
        
        userImage.contentMode = .scaleAspectFill
        
        return userImage
        
    }()
    
    lazy var nameLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 116, y: 8, width: backView.frame.width - 116, height: 30))
        
        label.textAlignment = .left
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
        
    }()
    
    lazy var ageLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 116, y: 42, width: backView.frame.width - 116, height: 30))
        
        label.textAlignment = .left
        
        return label
        
    }()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        // Initialization code
        
    }
    
    override func layoutSubviews() {
        
        contentView.backgroundColor = UIColor.clear
        
        backgroundColor = UIColor.clear
        
        backView.layer.cornerRadius = 5
        
        backView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        addSubview(backView)
        
        addSubview(userImage)
        
        addSubview(nameLabel)
        
        addSubview(ageLabel)
        
    }

}
