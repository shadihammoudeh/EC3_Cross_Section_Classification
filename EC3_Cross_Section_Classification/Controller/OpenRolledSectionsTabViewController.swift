//
//  OpenRolledSections.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 17/04/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class OpenRolledSectionsTabViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // The below Variables obtain their value from the NewFileTabController Class when viewDidLayoutSubviews cycle gets initiated:
    
    var newFileTabControllerStatusBarHeight: CGFloat = 0
    
    var newFileTabControllerNavigatioBarHeight: CGFloat = 0

    var newFileTabControllerTabBarHeight: CGFloat = 0
    
    var newFileTabControllerBottomSafeAreaHeight: CGFloat = 0
    
    // The below Array represents the titles of the cells to be displayed for the CollectionView cells:
    
    let cellTitleArray = ["Universal beams (UB)", "Universal columns (UC)", "Universal bearing piles (UBP)", "Parallel flange channels (PFC)", "Equal leg angles (L)", "Unequal leg angles (L)", "Tees (T) split from UB", "Tees (T) split from UC"]
    
    // The below Array represents the images for the cells to be displayed inside the CollectionView:
    
    let cellImageArray = ["3D Universal Beam (UB)","3D Universal Column (UC)","3D Universal Bearing Pile (UBP)","3D Parallel Flange Channels (PFC)","3D Equal Angle Leg (L)","3D Uequal Angle Leg (L)","3D Tees (T) Split from UB","3D Tees (T) Split from UC"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("OpenRolledSectionsTabViewController viewDidLoad()")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("OpenRolledSectionsTabViewController viewWillAppear()")
        
    }
    
    override func viewDidLayoutSubviews() {
        
        print("OpenRolledSectionsTabViewController viewDidLayoutSubviews()")
        
        // The below line of code calculates the required height for the OpenRolledSectionsTabViewController class. By substracting the total height of this view from the height of the NavigationBar plus Status Bar Height defined inside the NewFileTabController Class. The height of the TabBar as well as Bottom Safe Area Height are already substracted from the overall screen height of this ViewController (view.frame.size.height), and therefore, there is no need to substract them again:
        
        let openRolledSectionsCollectionViewHeight: CGFloat = view.frame.size.height  - newFileTabControllerNavigatioBarHeight - newFileTabControllerStatusBarHeight
        
        print("newFileTabController StatusBar Height is equal to \(newFileTabControllerStatusBarHeight)")
        
        print("newFileTabController Navigation Bar Height is equal to \(newFileTabControllerNavigatioBarHeight)")
        
        print("newFileTabController TabBar Height is equal to \(newFileTabControllerTabBarHeight)")
        
        print("newFileTabController Bottom Safe Area Height is equal to \(newFileTabControllerBottomSafeAreaHeight)")
        
        print("OpenRolledSections CollectionView total screen height is equal to \(view.frame.size.height)")
        
        print("Calculated OpenRolledSections CollectionView height is equal to \(openRolledSectionsCollectionViewHeight)")
        
        var openRolledSectionsCollectionView = CustomCollectionView(startingHoriztonalCoordinateOfCollectionView: 0, startingVerticalCoordinateOfCollectionView: newFileTabControllerStatusBarHeight+newFileTabControllerNavigatioBarHeight, widthOfCollectionView: view.frame.size.width, heightOfCollectionView: openRolledSectionsCollectionViewHeight, collectionViewLayoutTopEdgeInset: 20, collectionViewLayoutLeftEdgeInset: 20, collectionViewLayoutBottomEdgeInset: 20, collectionViewLayoutRightEdgeInset: 20, collectionViewLayoutCellsMinimumVerticalSpacings: 20, collectionViewLayoutCellsMinimumHorizontalSpacings: 20, numberOfCellsPerRow: 2, numberOfCellsPerColumn: 4, hostViewDataSource: self, hostViewDelegate: self, hexCodeColorForBackgroundColor: "#020301")
        
        view.addSubview(openRolledSectionsCollectionView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("OpenRolledSectionsTabViewController viewDidAppear()")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        print("FirstTabBarItem viewWillDisappear()")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        print("FirstTabBarItem viewDidDiappear()")
        
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
        
        if indexPath.row == 0 {
            
            let viewControllerToGoTo = UniversalBeamsViewController()
            
            present(viewControllerToGoTo, animated: true, completion: nil)
            
        }
        
    }
    
}
