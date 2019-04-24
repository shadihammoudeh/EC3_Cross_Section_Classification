//
//  OpenRolledSections.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 17/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class FirstItemInTabBarOpenRolledSections: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        // The below line of code specifies the top. right, bottom and left paddings for the cells (the one at the very top and very bottom are the cells that get affected by top and bottom values, all cells get affected by left and right values) inside the UICollectionView:
        
        layout.sectionInset = UIEdgeInsets(top: 45, left: 20, bottom: 50, right: 20)
        
        // The below line of code calculates the width of each cell assuming that we are going to have two
        
        func calculateEachCellWidthInsideCollectionView (numberOfCellsPerRow numberOfCells: CGFloat, middleSpacingBetweenCells spacing: CGFloat) -> CGFloat {
            
            let cellWidth = ((view.frame.width) - (layout.sectionInset.left + layout.sectionInset.right + spacing)) / numberOfCells
            
            return cellWidth
            
        }
        
        // The below line of code specifies the size of each cell to be displayed inside the UICollectionView:
        
        layout.itemSize = CGSize(width: calculateEachCellWidthInsideCollectionView(numberOfCellsPerRow: 2, middleSpacingBetweenCells: 20), height: 80)
        
        // The below line of code defines the minimum vertical spacings between cells:
        
        layout.minimumLineSpacing = 20
        
        // The below line of code defines the minimum horizontal spacings between cells:
        
        layout.minimumInteritemSpacing = 20
        
        let myCollectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        myCollectionView.dataSource = self
        
        myCollectionView.delegate = self
        
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        myCollectionView.backgroundColor = .white
        
        self.view.addSubview(myCollectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        
        myCell.backgroundColor = .blue
        
        return myCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("User tapped on itme \(indexPath.row)")
        
    }
    
}
