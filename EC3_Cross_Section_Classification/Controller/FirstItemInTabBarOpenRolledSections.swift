//
//  OpenRolledSections.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 17/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class FirstItemInTabBarOpenRolledSections: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var tabBarControllerStatusBarPlusNavigationBarHeight: CGFloat?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        print("FirstTabBarItem viewDidLoad()")
        
        view.backgroundColor = .black
        
    }
    
    override func viewDidLayoutSubviews() {
        
        print("FirstTabBarItem viewDidLayoutSubviews()")
        
        // The below line of code prints out the height of the tab bar inside the tabBarController including height of bottom safeAreaInset:
        
        print(tabBarController?.tabBar.frame.height)
        
        let customCollectionViewHeight: CGFloat = view.frame.size.height - (tabBarController?.tabBar.frame.height)! - tabBarControllerStatusBarPlusNavigationBarHeight!
        
        let customCollectionView = CustomCollectionView(startingHoriztonalCoordinateOfCollectionView: 0, startingVerticalCoordinateOfCollectionView: tabBarControllerStatusBarPlusNavigationBarHeight!, heightOfCollectionView: customCollectionViewHeight, viewCollectionViewWillBeAddedTo: self.view, collectionViewLayoutTopEdgeInset: 20, collectionViewLayoutLeftEdgeInset: 20, collectionViewLayoutBottomEdgeInset: 20, collectionViewLayoutRightEdgeInset: 20, collectionViewLayoutCellsMinimumVerticalSpacings: 20, collectionViewLayoutCellsMinimumHorizontalSpacings: 20, numberOfCellsPerRow: 2, numberOfCellsPerColumn: 4, hostViewDataSource: self, hostViewDelegate: self)
        
        view.addSubview(customCollectionView)
        
    }
    
    // The below methods are required to adopt the UICollectionViewDataSource and UICollectionViewDelegate protocols:
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        
        myCell.backgroundColor = .blue
        
        return myCell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print("User tapped on itme \(indexPath.row)")

    }
    
}
