//
//  UniversalBeams(UB)ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 08/05/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

class UniversalBeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate {

    lazy var customNavigationBar = CustomNavigationBar(navigationBarLeftButtonImage: "backButton", navigationBarItemsTintColour: .red, navigationBarButtonTarget: self, navigationBarButtonSelector: #selector(navigationBarLeftButtonPressed(sender:)), labelTitleText: "Universal Beams (UB)", labelTitleTextColour: .red, labelTitleFontSize: 18, labelTitleFontType: "AppleSDGothicNeo-Light", viewNavigationBarWillBeAddedTo: self.view, navigationBarDelegate: self, isNavigationBarTranslucent: true, navigationBarBackgroundColour: .black, navigationBarBarStyle: .black, navigationBarBarTintColourHexCode: "#F2F2F2")
        
    var universalBeams = [UniversalBeamClass]()
    
    var tableView = UITableView()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
        
        setTableView()
        
//       convertCSV(file: "data")
        
        // We are going to call the parse function as soon as the application loads:
        
        parseUniversalBeamsCSV()
        
    }
    
    // We want to create a function that will parse the Universal Beam CSV data into a form that is useful:
    
    func parseUniversalBeamsCSV() {
        
        // We first need a path for where the CSV file is located. The below can be forced un-wrapped since we know for sure that the path for the file does exist:
        
        let path = Bundle.main.path(forResource: "UB1016x305series", ofType: "csv")!
        
        // Then we need to use the parser (i.e., ParsingCSVfiles.csv) which can throw an error, thus, we need to use a do catch statement:
        
        do {
            
            let csv = try CSV(contentOfURL: path)
            
            // The below line of code will generate an array of dictionary, whereby each parsed CSV row represents a dictionary:
            
            let rows = csv.rows
            
            print(rows)
            
            // Now we want to pull out the data that we are interested in out of the parsed csv file generated in the above line of code. We need to loop through each row and pull out the data we want, create a new UB Section Designation. Then append it to the univeralBeams array above:
            
            for row in rows {
                
                let universalBeamSectionDesignation = row["Section designation"]!
                
                let universalBeamWebThickness = Double(row["Web thickness tw (mm)"]!)!
                
                let universalBeamWidth = Double(row["Width of section b (mm)"]!)!
                
                let universalBeamMassPerMetre = Double(row["Mass per metre (kg/m)"]!)!
                
                let universalBeamRootRadius = Double(row["Root radius r (mm)"]!)!
                
                let universalBeamDepthBetweenFillets = Double(row["Depth between fillets d (mm)"]!)!
                
                let universalBeamFlangeThickness = Double(row["Flange thickness tf (mm)"]!)!
                
                let universalBeamDepthOfSection = Double(row["Depth of section h (mm)"]!)!
                
                let univeralBeam = UniversalBeamClass(uBsectionDesignation: universalBeamSectionDesignation, uBwebThickness: universalBeamWebThickness, uBwidth: universalBeamWidth, uBmassPerMetre: universalBeamMassPerMetre, uBrootRadius: universalBeamRootRadius, uBdepthBetweenFillets: universalBeamDepthBetweenFillets, uBflangeThickness: universalBeamFlangeThickness, uBdepthOfSection: universalBeamDepthOfSection)
                
                // Then we need to append each of the above created univeral beam to the univeralBeams array created above:
                
                universalBeams.append(univeralBeam)
                
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
        
    }
    
    func setTableView() {
        
        tableView.frame = self.view.frame
        
        tableView.backgroundColor = UIColor.red
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.separatorColor = UIColor.clear
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor).isActive = true
        
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 118
        
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
