//
//  UniversalBeamClass.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 6/15/19.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import Foundation

class UniversalBeamClass {

private var universalBeamSectionDesignation: String!

private var universalBeamWebThickness: Double!

private var universalBeamWidth: Double!

private var universalBeamMassPerMetre: Double!

private var universalBeamRootRadius: Double!

private var universalBeamDepthBetweenFillets: Double!

private var universalBeamFlangeThickness: Double!

private var universalBeamDepthOfSection: Double!

var uBsectionDesignation: String {
    
    return universalBeamSectionDesignation
    
}

var uBwebThickness: Double {
    
    return universalBeamWebThickness
    
}

var uBwidth: Double {
    
    return universalBeamWidth
    
}

var uBmassPerMetre: Double {
    
    return universalBeamMassPerMetre
    
}

var uBrootRadius: Double {
    
    return universalBeamRootRadius
    
}

var uBdepthBetweenFillets: Double {
    
    return uBrootRadius
    
}

var uBflangeThickness: Double {
    
    return universalBeamFlangeThickness
    
}

var uBdepthOfSection: Double {
    
    return universalBeamDepthOfSection
    
}

init(uBsectionDesignation: String, uBwebThickness: Double, uBwidth: Double, uBmassPerMetre: Double, uBrootRadius: Double, uBdepthBetweenFillets: Double, uBflangeThickness: Double, uBdepthOfSection: Double) {
        
    self.universalBeamSectionDesignation = uBsectionDesignation
    
    self.universalBeamWebThickness = uBwebThickness
    
    self.universalBeamWidth = uBwidth
    
    self.universalBeamMassPerMetre = uBmassPerMetre
    
    self.universalBeamRootRadius = uBrootRadius
    
    self.universalBeamDepthBetweenFillets = uBdepthBetweenFillets
    
    self.universalBeamFlangeThickness = uBflangeThickness
    
    self.universalBeamDepthOfSection = uBdepthOfSection
    
}

}
