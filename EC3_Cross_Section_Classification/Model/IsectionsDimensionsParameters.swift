//
//  UniversalBeamClass.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 6/15/19.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import Foundation

class IsectionsDimensionsParameters {
    
    // Below are the dimensions properties related to I-Sections cross-sections, these will be filled by extracting the relevant data from the corresponding CSV file:
    
    var _sectionSeries: String!
    
    var _lastSectionSeriesNumber: String!
    
    var _fullSectionDesignation: String!
    
    var _sectionMassPerMetre: Double!
    
    var _depthOfSection: Double!
    
    var _widthOfSection: Double!
    
    var _sectionWebThickness: Double!
    
    var _sectionFlangeThickness: Double!
    
    var _sectionRootRadius: Double!
    
    var _depthOfSectionBetweenFillets: Double!
    
    var sectionSeries: String {
        
        return _sectionSeries
        
    }
    
    var lastSectionSeriesNumber: String {
        
        return _lastSectionSeriesNumber
        
    }
    
    var fullSectionDesignation: String {
        
        return _fullSectionDesignation
        
    }
    
    var sectionMassPerMetre: Double {
        
        return _sectionMassPerMetre
        
    }
    
    var depthOfSection: Double {
        
        return _depthOfSection
        
    }
    
    var widthOfSection: Double {
        
        return _widthOfSection
        
    }
    
    var sectionWebThickness: Double {
        
        return _sectionWebThickness
        
    }
    
    var sectionFlangeThickness: Double {
        
        return _sectionFlangeThickness
        
    }
    
    var sectionRootRadius: Double {
        
        return _sectionRootRadius
        
    }
    
    var depthOfSectionBetweenFillets: Double {
        
        return _depthOfSectionBetweenFillets
        
    }
    
    init(sectionSeries: String, lastSectionSeriesNumber: String, fullSectionDesignation: String, sectionMassPerMetre: Double, depthOfSection: Double, widthOfSection: Double, sectionWebThickness: Double, sectionFlangeThickness: Double, sectionRootRadius: Double, depthOfSectionBetweenFillets: Double) {
        
        self._sectionSeries = sectionSeries
        
        self._lastSectionSeriesNumber = lastSectionSeriesNumber
        
        self._fullSectionDesignation = fullSectionDesignation
        
        self._sectionMassPerMetre = sectionMassPerMetre
        
        self._depthOfSection = depthOfSection
        
        self._widthOfSection = widthOfSection
        
        self._sectionWebThickness = sectionWebThickness
        
        self._sectionFlangeThickness = sectionFlangeThickness
        
        self._sectionRootRadius = sectionRootRadius
        
        self._depthOfSectionBetweenFillets = depthOfSectionBetweenFillets
        
    }
    
}
