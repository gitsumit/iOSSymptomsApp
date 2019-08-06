//
//  IntensityViewController.swift
//  DemoApp
//
//  Created by Sumit Jain on 6/08/19.
//  Copyright © 2019 Sumit Jain. All rights reserved.
//

import UIKit

class IntensityViewController: UITableViewController {

    
    
    @IBOutlet var objTableView: UITableView!
 
    //Data collection initialization
    let sections: [String] = ["Causes", "Improvment", "Remedies"]
    let s1Data: [String] = ["body aches and pains", "coughing", "chills"]
    let s2Data: [String] = ["improve after 7–10 days"]
    let s3Data: [String] = ["resting", "staying hydrated", "(OTC) medications"]
    
    var sectionData: [Int: [String]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        sectionData = [0:s1Data, 1:s2Data, 2:s3Data]
        
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return (sectionData[section]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)
        -> String? {
            return sections[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            if cell == nil
            {
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell");
            }
            cell!.textLabel?.text = sectionData[indexPath.section]![indexPath.row]
            return cell!
    }

}
