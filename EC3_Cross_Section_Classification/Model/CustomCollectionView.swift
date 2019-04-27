//
//  CustomCollectionView.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 24/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class CustomCollectionView: UICollectionView {

    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    convenience init(topEdgeInset topInset: CGFloat, bottomEdgeInset bottomInset: CGFloat, leftEdgeInset leftInset: CGFloat, rightEdgeInset rightInset: CGFloat, screenWdith width: CGFloat, screenHeight height: CGFloat, minimumCellsHorizontalSpacing cellsHorizontalSpacing: CGFloat, minimumCellsVerticalSpacing cellsVerticalSpacing: CGFloat, numberOfCellsPerRow cellsPerRow: CGFloat, hostView: UIView, hostViewDelegate: UICollectionViewDelegate, hostViewDataSource: UICollectionViewDataSource) {
        
        self.init(frame: {
            
            CGRect(x: 0, y: 0, width: hostView.frame.width, height: hostView.frame.height)
            
        }(), collectionViewLayout: {
            
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            
            layout.sectionInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
            
            layout.minimumLineSpacing = cellsVerticalSpacing
            
            layout.minimumInteritemSpacing = cellsHorizontalSpacing
            
            let widthOfCollectionViewCell: CGFloat = (width - (leftInset + rightInset + cellsHorizontalSpacing)) / cellsPerRow
            
            layout.itemSize = CGSize(width: widthOfCollectionViewCell, height: 200)
            
            return layout
            
        }()
            
        )
        
        dataSource = hostViewDataSource
        
        delegate = hostViewDelegate
        
        backgroundColor = .red
        
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        hostView.addSubview(self)
        
    }
    
}
