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
    
    convenience init(startingHoriztonalCoordinateOfCollectionView xCoordinate: CGFloat, startingVerticalCoordinateOfCollectionView yCoordinate: CGFloat, heightOfCollectionView height: CGFloat, viewCollectionViewWillBeAddedTo hostView: UIView, collectionViewLayoutTopEdgeInset topInset: CGFloat, collectionViewLayoutLeftEdgeInset leftInset: CGFloat, collectionViewLayoutBottomEdgeInset bottomInset: CGFloat, collectionViewLayoutRightEdgeInset rightInset: CGFloat, collectionViewLayoutCellsMinimumVerticalSpacings cellsVerticalSpacings: CGFloat, collectionViewLayoutCellsMinimumHorizontalSpacings cellsHorizontalSpacings: CGFloat, numberOfCellsPerRow cellsPerRow: CGFloat, numberOfCellsPerColumn cellsPerColumn: CGFloat, hostViewDataSource: UICollectionViewDataSource, hostViewDelegate: UICollectionViewDelegate) {
        
        self.init(frame: CGRect(x: xCoordinate, y: yCoordinate, width: hostView.frame.size.width, height: height), collectionViewLayout: {
            
            let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            
            //  The below line of code specifies the top. right, bottom and left paddings for the cells (the one at the very top and very bottom are the cells that get affected by top and bottom values, all cells get affected by left and right values) inside the UICollectionView:
            
            collectionViewLayout.sectionInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
            
            // The below line of code defines the minimum vertical spacings between cells:
            
            collectionViewLayout.minimumLineSpacing = cellsVerticalSpacings
            
            // The below line of code defines the minimum horizontal spacings between cells:
            
            collectionViewLayout.minimumInteritemSpacing = cellsHorizontalSpacings
            
            let widthOfSingleCollectionViewCell: CGFloat = ((hostView.frame.size.width) - (leftInset + rightInset + (cellsHorizontalSpacings * (cellsPerRow - 1)))) / cellsPerRow
            
            let heightOfSingleCollectionViewCell: CGFloat = ((height) - (topInset + bottomInset + (cellsVerticalSpacings * (cellsPerColumn - 1)))) / cellsPerColumn
            
            // The below line of code specifies the size of each cell to be displayed inside the UICollectionView:
            
            collectionViewLayout.itemSize = CGSize(width: widthOfSingleCollectionViewCell, height: heightOfSingleCollectionViewCell)
            
            return collectionViewLayout
            
        } ()
            
        )
        
        dataSource = hostViewDataSource
        
        delegate = hostViewDelegate
        
        backgroundColor = .red
        
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
    }
    
}
        
        
        
//
//        self.init(frame: {
////
////            CGRect(x: 0, y: 0, width: hostView.frame.width, height: hostView.frame.height)
//
//        }(), collectionViewLayout: {
//
//            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//            //  The below line of code specifies the top. right, bottom and left paddings for the cells (the one at the very top and very bottom are the cells that get affected by top and bottom values, all cells get affected by left and right values) inside the UICollectionView:
//
//            layout.sectionInset = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
//
//            // The below line of code defines the minimum vertical spacings between cells:
//
////            layout.minimumLineSpacing = cellsVerticalSpacing
//
//            // The below line of code defines the minimum horizontal spacings between cells:
//
//            layout.minimumInteritemSpacing = cellsHorizontalSpacing
//
//            let widthOfCollectionViewCell: CGFloat = (width - (leftInset + rightInset + cellsHorizontalSpacing)) / cellsPerRow
//
////            let heightOfCollectionViewCell: CGFloat = (height - (topInset + bottomInset + cellsVerticalSpacing)) / cellsPerColumn
//
//            // The below line of code specifies the size of each cell to be displayed inside the UICollectionView:
//
////            layout.itemSize = CGSize(width: widthOfCollectionViewCell, height: heightOfCollectionViewCell)
//
//            return layout
//
//        }()
//
//        )
//
//        dataSource = hostViewDataSource
//
//        delegate = hostViewDelegate
//
//        backgroundColor = .red
//
//        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//
////        hostView.addSubview(self)
//
//        setupConstraints(viewThatCustomCollectionViewWillBeAddedTo: hostView)
//
//    }
//
//    func setupConstraints(viewThatCustomCollectionViewWillBeAddedTo hostView: UIView) {
//
//        translatesAutoresizingMaskIntoConstraints = false
//
////        topAnchor.constraint(equalTo: hostView.topAnchor).isActive = true
////
////        bottomAnchor.constraint(equalTo: hostView.bottomAnchor).isActive = true
////
////        leftAnchor.constraint(equalTo: hostView.leftAnchor).isActive = true
////
////        rightAnchor.constraint(equalTo: hostView.rightAnchor).isActive = true
//
//    }

