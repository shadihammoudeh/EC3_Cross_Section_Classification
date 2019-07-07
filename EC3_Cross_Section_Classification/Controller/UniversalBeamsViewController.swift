//
//  UniversalBeams(UB)ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 08/05/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

import ChameleonFramework

class UniversalBeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate {
    
    // The below code line declares the custom NavigationBar to be added to this ViewController. The reason it is defined as a lazy var, is to allow us to access the view properties:
    
    lazy var navigationBar = CustomNavigationBar(navigationBarLeftButtonImage: "backButton", navigationBarItemsTintColour: .green, navigationBarButtonTarget: self, navigationBarButtonSelector: #selector(navigationBarLeftButtonPressed(sender:)), labelTitleText: "Universal Beams (UB)", labelTitleTextColour: .red, labelTitleFontSize: 18, labelTitleFontType: "AppleSDGothicNeo-Light", navigationBarDelegate: self, isNavigationBarTranslucent: false, navigationBarBackgroundColour: .black, navigationBarBarStyle: .black, navigationBarBarTintColourHexCode: "#030806")
    
    var tableSectionHeaderFont = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
    
    // The below Array is the one which contains the data extracted from the passed CSV file. It contains the data in a one big Array, which contains several Arrays inside it, whereby each Array inside the big Array contains several Dictionaries:
    
    var universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser = [IsectionsDimensionsParameters]()
    
    // The below Array is mapped from the above Array, whereby only sectionSerialNumbers are reported inside of it, with no duplication using the extension at the end of this Class (i.e., Array):
    
    lazy var universalBeamsSectionSerialNumberArray = universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.map({ return $0.sectionSerialNumber }).removingDuplicates()
    
    // The below is the first ViewController cycle:
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("UniversalBeamsViewController viewDidLoad()")
        
        view.addSubview(navigationBar)
        
        let universalBeamsTableView = CustomTableView(tableViewBackgroundColourHexCode: "#0D0D0D", tableViewDelegate: self, tableViewDataSource: self, tableViewHostView: self.view, tableViewCustomCellClassToBeRegistered: IsectionsCustomTableViewCell.self, tableViewCustomCellReuseIdentifierToBeRegistered: "customCell", tableViewTopAnchor: navigationBar.bottomAnchor, tableViewBottomAnchor: view.bottomAnchor)
        
        // We are going to call the parse function as soon as the application loads in order to extract the CSV data inside of it:
        
        parseCsvFile(csvFileToParse: "UniversalBeamsDimensions")
        
        // The below code sorts the Data reported from the relevant CSV file using the Parser either in an Ascending or Dscending order:
        
        universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.sort {
            
            if $0.firstSectionSeriesNumber != $1.firstSectionSeriesNumber {
                
                return $0.firstSectionSeriesNumber < $1.firstSectionSeriesNumber
                
            } else if $0.sectionSerialNumber != $1.sectionSerialNumber {
                
                return $0.sectionSerialNumber < $1.sectionSerialNumber
                
            } else {
                
                return $0.lastSectionSeriesNumber < $1.lastSectionSeriesNumber
                
            }
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("UniversalBeamsViewController viewWillAppear()")
        
    }
    
    override func viewDidLayoutSubviews() {
        
        print("UniversalBeamsViewController viewDidLayoutSubViews()")
        
        setupNavigationBarConstraints()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("UniversalBeamsViewController viewDidAppear()")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        print("UniversalBeamsViewController viewWillDisappear()")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        print("UniversalBeamsViewController viewDidDisappear()")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // The below code returns the total number of items inside the universalBeamsSectionSerialNumberArray, which is equal to the ttoal number of section in our table:
        
        return universalBeamsSectionSerialNumberArray.count
        
    }
    
    // The below function defines the properties of section headers as well as what should be displayed inside them:
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeaderView = UIView()
        
        let sectionHeaderTitle = UILabel()
        
        sectionHeaderTitle.font = tableSectionHeaderFont
        
        sectionHeaderTitle.translatesAutoresizingMaskIntoConstraints = false
        
        sectionHeaderView.frame.size.width = view.frame.size.width
        
        let maxWidth = view.frame.size.width

        sectionHeaderView.backgroundColor = UIColor(hexString: "#BF2C0B")
        
        sectionHeaderTitle.textColor = UIColor(hexString: "#F2AB6D")
        
        sectionHeaderTitle.textAlignment = .left
        
        sectionHeaderTitle.text = universalBeamsSectionSerialNumberArray[section] + " Series"
        
        sectionHeaderTitle.numberOfLines = 0
        
        sectionHeaderTitle.frame.size.width = sectionHeaderView.frame.size.width
        
        sectionHeaderTitle.frame.size.height = calculateUILabelHeightBasedOnItsText(text: sectionHeaderTitle.text!, font: tableSectionHeaderFont!, width: maxWidth)
        
        sectionHeaderView.addSubview(sectionHeaderTitle)
        
        NSLayoutConstraint.activate([
        
            sectionHeaderTitle.leftAnchor.constraint(equalTo: sectionHeaderView.leftAnchor, constant: 20),
            
            sectionHeaderTitle.rightAnchor.constraint(equalTo: sectionHeaderView.rightAnchor, constant: -20),
            
            sectionHeaderTitle.centerYAnchor.constraint(equalTo: sectionHeaderView.centerYAnchor)
            
        ])
        
        return sectionHeaderView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return calculateUILabelHeightBasedOnItsText(text: universalBeamsSectionSerialNumberArray[section] + " Series", font: tableSectionHeaderFont!, width: view.frame.size.width - 40)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // The below line of code will convert the original Array into an Array of key-value pairs using tuples, where each value has the number 1:
        
        let convertedUniversalBeamsArrayDataExtractedFromTheCsvFileUsingTheParserIntoKeyValuePairsTuples = universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.map { ($0.sectionSerialNumber, 1) }
        
        // The below line of code create a Dictionary from the above tuple array, asking it to add the 1s together every time it finds a duplicate key:
        
        var totalSectionSerialNumberCountDictionaryCollection = Dictionary(convertedUniversalBeamsArrayDataExtractedFromTheCsvFileUsingTheParserIntoKeyValuePairsTuples, uniquingKeysWith: +)
        
        return totalSectionSerialNumberCountDictionaryCollection["\(universalBeamsSectionSerialNumberArray[section])"]!
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! IsectionsCustomTableViewCell
        
        cell.sectionDesignationLabel.text = universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.filter({ $0.sectionSerialNumber == "\(universalBeamsSectionSerialNumberArray[indexPath.section])" }).map({ $0.fullSectionDesignation })[indexPath.row] + " Section:\(indexPath.section) Row:\(indexPath.row)"
        
        cell.depthOfSectionLabel.text = "Depth, h [mm] = " + String(universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.filter({ $0.sectionSerialNumber == "\(universalBeamsSectionSerialNumberArray[indexPath.section])" }).map({ $0.depthOfSection })[indexPath.row])
        
        cell.widthOfSectionLabel.text = "Width, b [mm] = " + String(universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.filter({ $0.sectionSerialNumber == "\(universalBeamsSectionSerialNumberArray[indexPath.section])" }).map({ $0.widthOfSection })[indexPath.row])
        
        let fontForTheWholeString : UIFont? = UIFont(name: "AppleSDGothicNeo-Light", size: 14.50)
        
        let fontForTheSubScriptCharacter: UIFont? = UIFont(name: "AppleSDGothicNeo-Light", size: 10)
        
        let attributedSectionWebThicknessString: NSMutableAttributedString = NSMutableAttributedString(string: "Web Thickness, tw [mm] = \(String(universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.filter({ $0.sectionSerialNumber == "\(universalBeamsSectionSerialNumberArray[indexPath.section])" }).map({ $0.sectionWebThickness })[indexPath.row]))", attributes: [.font:fontForTheWholeString!])
        attributedSectionWebThicknessString.setAttributes([.font:fontForTheSubScriptCharacter!,.baselineOffset:-6.5], range: NSRange(location:16,length:1))
        
        cell.sectionWebThicknessLabel.attributedText = attributedSectionWebThicknessString
        
        let attributedSectionFlangeThicknessString: NSMutableAttributedString = NSMutableAttributedString(string: "Flange Thickness, tf [mm] = \(String(universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.filter({ $0.sectionSerialNumber == "\(universalBeamsSectionSerialNumberArray[indexPath.section])" }).map({ $0.sectionFlangeThickness })[indexPath.row]))", attributes: [.font:fontForTheWholeString!])
        attributedSectionFlangeThicknessString.setAttributes([.font: fontForTheSubScriptCharacter!,.baselineOffset: -6.5], range: NSRange(location: 19, length: 1))
        
        cell.sectionFlangeThicknessLabel.attributedText = attributedSectionFlangeThicknessString
        
        cell.depthOfSectionLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14.5)
        
        cell.widthOfSectionLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 14.5)
        
        
        
        cell.backgroundColor = UIColor(hexString: "#0D0D0D")
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
        
    }
    
    @objc func navigationBarLeftButtonPressed(sender : UIButton) {
        
        print("button pressed")
        
        let controllerToGoBackTo = NewFileTabController()
        
        present(controllerToGoBackTo, animated: false, completion: nil)
        
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        
        return UIBarPosition.topAttached
        
    }
    
    // The below function calculates the needed height for a UILabel based on the size of the text inisde of it:
    
    func calculateUILabelHeightBasedOnItsText (text:String, font:UIFont, width:CGFloat) -> CGFloat{
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        
        // The below code line allows the UILabel to display the text on multiple lines if the do not fit in its width:
        
        label.numberOfLines = 0
        
        // lineBreakMode in the below code defines the technique used to for wrapping and trauncating the label's text.
        
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        label.font = font
        
        label.text = text
        
        label.sizeToFit()
        
        return label.frame.height
        
    }
    
    func setupNavigationBarConstraints() {
        
        NSLayoutConstraint.activate([
            
            navigationBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            navigationBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            
            ])
        
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
                
                let firstSectionSeriesNumber = Int(row["First Section Series Number"]!)!
                
                let secondSectionSeriesNumber = Int(row["Second Section Series Number"]!)!
                
                let lastSectionSeriesNumber = Int(row["Last Section Series Number"]!)!
                
                let sectionSerialNumber = row["Section Serial Number"]!
                
                let fullSectionDesignation = row["Full Section Designation"]!
                
                let sectionMassPerMetre = Double(row["Mass Per Metre (kg/m)"]!)!
                
                let depthOfSection = Double(row["Depth of Section [h] (mm)"]!)!
                
                let widthOfSection = Double(row["Width of Section [b] (mm)"]!)!
                
                let sectionWebThickness = Double(row["Web Thickness [tw] (mm)"]!)!
                
                let sectionFlangeThickness = Double(row["Flange Thickness [tf] (mm)"]!)!
                
                let sectionRootRadius = Double(row["Root Radius [r] (mm)"]!)!
                
                let depthOfSectionBetweenFillets = Double(row["Depth between Fillets [d] (mm)"]!)!
                
                let individualUniversalBeamArrayOfDictionaries = IsectionsDimensionsParameters(firstSectionSeriesNumber: firstSectionSeriesNumber, secondSectionSeriesNumber: secondSectionSeriesNumber, lastSectionSeriesNumber: lastSectionSeriesNumber, sectionSerialNumber: sectionSerialNumber, fullSectionDesignation: fullSectionDesignation, sectionMassPerMetre: sectionMassPerMetre, depthOfSection: depthOfSection, widthOfSection: widthOfSection, sectionWebThickness: sectionWebThickness, sectionFlangeThickness: sectionFlangeThickness, sectionRootRadius: sectionRootRadius, depthOfSectionBetweenFillets: depthOfSectionBetweenFillets)
                
                // Then we need to append each of the above created Array of Dictionaries to the main Array declared above:
                universalBeamsArrayDataExtractedFromTheCsvFileUsingTheParser.append(individualUniversalBeamArrayOfDictionaries)
                
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
        
    }
    
}

// The below extension is needed in order to extend the Array's functionalities so that any duplicate item inside Arrays can be removed:

extension Array where Element: Hashable {
    
    func removingDuplicates() -> [Element] {
        
        var addedDict = [Element: Bool]()
        
        return filter {
            
            addedDict.updateValue(true, forKey: $0) == nil
            
        }
        
    }
    
    mutating func removeDuplicates() {
        
        self = self.removingDuplicates()
        
    }
    
}
