//
//  UniversalBeams(UB)ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 08/05/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class UniversalBeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate {
    
    lazy var customNavigationBar = CustomNavigationBar(navigationBarLeftButtonImage: "backButton", navigationBarItemsTintColour: .green, navigationBarButtonTarget: self, navigationBarButtonSelector: #selector(navigationBarLeftButtonPressed(sender:)), labelTitleText: "Universal Beams (UB)", labelTitleTextColour: .red, labelTitleFontSize: 18, labelTitleFontType: "AppleSDGothicNeo-Light", viewNavigationBarWillBeAddedTo: self.view, navigationBarDelegate: self, isNavigationBarTranslucent: false, navigationBarBackgroundColour: .black, navigationBarBarStyle: .black, navigationBarBarTintColourHexCode: "#030806")
    
    var universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser = [IsectionsDimensionsParameters]()
    
    // Filter, Map and Reduce iterate over a collection (such as Arrays and Dictionaries) and they make changes to it, and then they spit it back in a new form. Think of it as doing the same thing as a For Loop, however, using a much cleaner way to write it.
    
    //    lazy var universalBeamsSeries1016x305Array = universalBeamsArraysOfDictionariesFromCsvFile.filter({ return $0.universalBeamSectionDesignation.contains("1016 x 305") })
    //
    //    lazy var gst = universalBeamsSeries1016x305Array.map({$0.universalBeamSectionDesignation!})
    
    // Below we are declaring the UITableView, which is going to display the data for all of the Universal Beams. We will create a section inside the UITableView for each UB series, and inside each section we are going to list the various UBs for that specific series:
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("UniversalBeamsViewController viewDidLoad initiated")
        
        let customTableView = CustomTableView(tableViewDelegate: self, tableViewDataSource: self, tableViewHostView: self.view, tableViewCustomCellClassToBeRegistered: IsectionsCustomTableViewCell.self, tableViewCustomCellReuseIdentifierToBeRegistered: "customCell", tableViewTopAnchor: customNavigationBar.bottomAnchor
            , tableViewBottomAnchor: view.bottomAnchor)
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
        
        // We are going to call the parse function as soon as the application loads:
        
        parseCsvFile(csvFileToParse: "UniversalBeamsDimensions")
        
    }
    
    // We want to create a function that will parse the Universal Beam CSV data into a format that is useful:
    
    func parseCsvFile(csvFileToParse: String) {
        
        // We first need a path for where the CSV file is located. The below can be forced un-wrapped since we know for sure that the path for the file does exist:
        
        let path = Bundle.main.path(forResource: csvFileToParse, ofType: "csv")!
        
        // Then we need to use the parser (i.e., CsvParser.swift) which can throw an error, thus, we need to use a do catch statement:
        
        do {
            
            // In the below line of code we are passing the path of the CSV file we are interested in extracting its data and pass it to the CsvParser Class:
            
            let csv = try CsvParser(contentOfURL: path)
            
            // The below line of code will generate an array of dictionaries, whereby each parsed CSV row represents an Array of Dictionaries:
            
            let rows = csv.rows
            
            // Now we want to pull out the data that we are interested in out of the parsed csv file generated in the above line of code. As the above code line will spit out the data in an Arrays of Dictionaries format, whereby each line is going to be an Array, which contains multiple dictionaries inside of it, and each Dictionary is going to have a title as its Key and a value as its Value. We need to loop through each row and pull out the data we want. Then each extraced row (Array of Dictionaries) is going to be appended to the big Array (i.e., universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser) which is going to contain all other Arrays:
            
            for row in rows {
                
                let sectionSeries = row["Section Series"]!
                
                let lastSectionSeriesNumber = row["Last Section Series Number"]!
                
                let fullSectionDesignation = row["Full Section Designation"]!
                
                let sectionMassPerMetre = Double(row["Mass Per Metre (kg/m)"]!)!
                
                let depthOfSection = Double(row["Depth of Section [h] (mm)"]!)!
                
                let widthOfSection = Double(row["Width of Section [b] (mm)"]!)!
                
                let sectionWebThickness = Double(row["Web Thickness [tw] (mm)"]!)!
                
                let sectionFlangeThickness = Double(row["Flange Thickness [tf] (mm)"]!)!
                
                let sectionRootRadius = Double(row["Root Radius [r] (mm)"]!)!
                
                let depthOfSectionBetweenFillets = Double(row["Depth between Fillets [d] (mm)"]!)!
                
                let individualUniversalBeamArrayOfDictionaries = IsectionsDimensionsParameters(sectionSeries: sectionSeries, lastSectionSeriesNumber: lastSectionSeriesNumber, fullSectionDesignation: fullSectionDesignation, sectionMassPerMetre: sectionMassPerMetre, depthOfSection: depthOfSection, widthOfSection: widthOfSection, sectionWebThickness: sectionWebThickness, sectionFlangeThickness: sectionFlangeThickness, sectionRootRadius: sectionRootRadius, depthOfSectionBetweenFillets: depthOfSectionBetweenFillets)
                
                // Then we need to append each of the above created Array of Dictionaries to the main Array declared above:
                
                universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.append(individualUniversalBeamArrayOfDictionaries)
                
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
        
    }
    
    // The below function specifies how many cells in total should be displayed in our table:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! IsectionsCustomTableViewCell
        
        let universalBeamsSeries1016x305Array = universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.filter({ return $0.fullSectionDesignation.contains("1016 x 305") })
        
        var gst = universalBeamsSeries1016x305Array.map({$0.fullSectionDesignation})
        
        cell.sectionDesignationLabel.text = gst[indexPath.row]
        //
        cell.sectionDesignationLabel.textColor = .black
        
        cell.sectionDesignationLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 15)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1 {
            
            return "1016 x 305 series"
            
        }
        
        return "Something else"
        
    }
    
    @objc func navigationBarLeftButtonPressed(sender : UIButton) {
        
        print("button pressed")
        
        let controllerToGoBackTo = NewFileButtonPressedTabController()
        
        present(controllerToGoBackTo, animated: false, completion: nil)
        
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        
        return UIBarPosition.topAttached
        
    }
    
}
