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
    
    convenience init(topEdgeInset topInset: CGFloat, leftEdgeInset leftInset: CGFloat, bottomEdgeInset bottomInset: CGFloat, rightEdgeInset rightInset: CGFloat, widthOfUICollectionView width: CGFloat, horizontalSpacingsBetweenCells horizontalSpacings: CGFloat, numberOfCellsPerRow horizontalNumberOfCells: CGFloat, heightOfUICollectionView height: CGFloat, verticalSpacingsBetweenCells verticalSpacings: CGFloat, numberOfCellsPerColumn verticalNumberOfCells: CGFloat, minimumVerticalSpacingsBetweenCells minimumVertical: CGFloat, minimumHorizontalSpacingsBetweenCells minimumHorizontal: CGFloat) {
        
        self.init()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        
        let cellWidth = ((width) - (layout.sectionInset.left + layout.sectionInset.right + horizontalSpacings)) / horizontalNumberOfCells
        
        let cellHeight = ((height) - (layout.sectionInset.top + layout.sectionInset.bottom + verticalSpacings)) / verticalNumberOfCells
        
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        layout.minimumLineSpacing = minimumVertical
        
        layout.minimumInteritemSpacing = minimumHorizontal
        
        
        
    }
    
}
