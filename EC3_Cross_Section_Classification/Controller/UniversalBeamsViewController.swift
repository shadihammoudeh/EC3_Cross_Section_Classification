//
//  UniversalBeams(UB)ViewController.swift
//  EC3_Cross_Section_Classification
//
//  Created by Shadi Hammoudeh on 08/05/2019.
//  Copyright © 2019 Bespoke Engineering. All rights reserved.
//

import UIKit

//class UserModal {
//
//    var userImage: UIImage?
//
//    var name: String?
//
//    var age: String?
//
//    init(userImage: UIImage, name: String, age: String) {
//
//        self.userImage = userImage
//
//        self.name = name
//
//        self.age = age
//
//    }
//
//}

class UniversalBeamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate {

    lazy var customNavigationBar = CustomNavigationBar(navigationBarLeftButtonImage: "backButton", navigationBarItemsTintColour: .red, navigationBarButtonTarget: self, navigationBarButtonSelector: #selector(navigationBarLeftButtonPressed(sender:)), labelTitleText: "Universal Beams (UB)", labelTitleTextColour: .red, labelTitleFontSize: 18, labelTitleFontType: "AppleSDGothicNeo-Light", viewNavigationBarWillBeAddedTo: self.view, navigationBarDelegate: self, isNavigationBarTranslucent: true, navigationBarBackgroundColour: .black, navigationBarBarStyle: .black, navigationBarBarTintColourHexCode: "#F2F2F2")
    
    var tableView = UITableView()
    
//    var userModal = [UserModal]()
    
    var  data:[[String:String]] = []
    
    var  columnTitles:[String] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
        
        setTableView()
        
       convertCSV(file: "data")
        

        
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
    
    // The below Method extracts a Swift Array from the plist file:

//    func getSwiftArrayFromPlist(name: String) -> (Array<Dictionary<String, String>>) {
//
//        let path = Bundle.main.path(forResource: name, ofType: "plist")
//
//        let array = NSArray(contentsOfFile: path!)
//
//        return ((array as? Array<Dictionary<String, String>>)!)
//
//    }

    // The below Method extracts a row of data for a particular value in a column:

//    func getDataForSectionDesignation(sectionDesignation: String) -> (Array<[String: String]>) {
//
//        let array = getSwiftArrayFromPlist(name: "UB 1016x305 series")
//
//        // A Predicate is a filter: you specify the criteria you want to match, and Core Data will ensure that only matching objects get returned. The %@ will be instantly recognisable to anyone who has used Objective-C before, and it means "place the contents of a variable here, whatever data type it is".
//
//        let namePredicate = NSPredicate(format: "Section designation = %@", sectionDesignation)
//
//        // The filter Method loops over a collection and return an Array containing only thos elements that match an icnlude condition:
//
//        return [array.filter {namePredicate.evaluate(with: $0)}[0]]
//
//    }
    
    func readDataFromFile(file:String) -> String!{
        
        guard let filepath = Bundle.main.path(forResource: file, ofType: "txt")
            
            else {
                
                return nil
                
        }
    
        do {
            
            let contents = try String(contentsOfFile: filepath)
            
            return contents
            
        } catch {
            
            print("File Read Error for file \(filepath)")
            
            return nil
            
        }
        
    }
    
    func cleanRows(file: String)->String{
        
        var cleanFile = readDataFromFile(file: file)
        
        cleanFile = cleanFile!.replacingOccurrences(of: "\r", with: "\n")
        
        cleanFile = cleanFile!.replacingOccurrences(of: "\n\n", with: "\n")
        
        return cleanFile!
        
    }
    
    func getStringFieldsForRow(row:String, delimiter:String)-> [String]{
        
        return row.components(separatedBy: delimiter)
        
    }
    
    func convertCSV(file:String){
        
        let rows = cleanRows(file: file).components(separatedBy: "\n")
        
        if rows.count > 0 {
            
            data = []
            
            columnTitles = getStringFieldsForRow(row: rows.first!,delimiter:",")
            
            for row in rows {
                
                let fields = getStringFieldsForRow(row: row,delimiter: ",")
                
                if fields.count != columnTitles.count {continue}
                
                var dataRow = [String:String]()
                
                for (index,field) in fields.enumerated(){
                    
                    let fieldName = columnTitles[index]
                    
                    dataRow[fieldName] = field
                    
                }
                
                data += [dataRow]
                
            }
            
        } else {
            
            print("No data in file")
            
        }
        
        data.remove(at: 0)
        
        print(data[0])
        
        print([data[0]["Depth of section h (mm)"]])
        
    }
    
//    func printData(){
//
//        convertCSV(file: textView.text)
//
//        var tableString = ""
//
//        var rowString = ""
//
//        print("data: \(data)")
//
//        for row in data{
//
//            rowString = ""
//
//            for fieldName in columnTitles{
//
//                guard let field = row[fieldName] else{
//
//                    print("field not found: \(fieldName)")
//
//                    continue
//
//                }
//
//                rowString += String(format:"%@     ",field)
//
//            }
//
//            tableString += rowString + "\n"
//
//        }
//
//        textView.text = tableString
//
//    }

}
