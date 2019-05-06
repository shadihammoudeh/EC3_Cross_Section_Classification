//
//  OpenRolledSections.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 17/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class FirstItemInTabBarOpenRolledSections: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // The below Variable gets its value from the NewFileButtonPressedTabController UITabController:
    
    var tabBarControllerStatusBarPlusNavigationBarHeight: CGFloat = 0
    
    let cellTitleArray = ["Universal beams (UB)", "Universal columns (UC)", "Universal bearing piles (UBP)", "Parallel flange channels (PFC)", "Equal leg angles (L)", "Unequal leg angles (L)", "Tees (T) split from UB", "Tees (T) split from UC"]
    
   let cellImageArray = ["3D Universal Beam (UB)","3D Universal Column (UC)","3D Universal Bearing Pile (UBP)","3D Parallel Flange Channels (PFC)","3D Equal Angle Leg (L)","3D Uequal Angle Leg (L)","3D Tees (T) Split from UB","3D Tees (T) Split from UC"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("FirstTabBarItem viewDidLoad()")
        
    }
    
    override func viewDidLayoutSubviews() {
        
        print("FirstTabBarItem viewDidLayoutSubviews()")
        
        // The below line of code calculates the height of the customCollectionView by substracting the total height of this view which is inside the UITabController class (thus, its total height is the total height of the iPhonescreen minus the height of the tabBar) minus the height of the UITabBarController class status bar plus its NavigationBar:
        
        let customCollectionViewHeight: CGFloat = view.frame.size.height  - tabBarControllerStatusBarPlusNavigationBarHeight
        
        print(customCollectionViewHeight)
        
        print(view.frame.size.height)
        
        let customCollectionView = CustomCollectionView(startingHoriztonalCoordinateOfCollectionView: 0, startingVerticalCoordinateOfCollectionView: tabBarControllerStatusBarPlusNavigationBarHeight, heightOfCollectionView: customCollectionViewHeight, viewCollectionViewWillBeAddedTo: self.view, collectionViewLayoutTopEdgeInset: 20, collectionViewLayoutLeftEdgeInset: 20, collectionViewLayoutBottomEdgeInset: 20, collectionViewLayoutRightEdgeInset: 20, collectionViewLayoutCellsMinimumVerticalSpacings: 20, collectionViewLayoutCellsMinimumHorizontalSpacings: 20, numberOfCellsPerRow: 2, numberOfCellsPerColumn: 4, hostViewDataSource: self, hostViewDelegate: self, hexCodeColorForBackgroundColor: "#020301")
        
        view.addSubview(customCollectionView)
        
    }
    
    // The below methods are required to adopt the UICollectionViewDataSource and UICollectionViewDelegate protocols:
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 8
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomCollectionViewCell
        
        myCell.setupCustomCellElements(cellImageName: cellImageArray[indexPath.item], cellTitleTextColour: "#797D70", cellTitleTextSize: 15, cellTitleFontType: "Apple SD Gothic Neo", cellTitle: cellTitleArray[indexPath.item], cellHexColorCode: "#E8FFB5", cellCornerRadius: 3, cellShadowOffsetWidth: 0, cellShadowOffsetHeight: 1.5, cellShadowColor: "#9CCC38", cellShadowRadius: 3, cellShadowOpacity: 0.6)
        
        print(myCell.frame.size.height)

        return myCell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("User tapped on itme \(indexPath.row)")
        
    }
    
}
