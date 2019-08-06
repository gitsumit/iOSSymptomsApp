//
//  ViewController.swift
//  DemoApp
//
//  Created by Sumit Jain on 3/08/19.
//  Copyright © 2019 Sumit Jain. All rights reserved.
//

import UIKit


struct Symptoms {
    var id : String
    var title : String
}

class ViewController: UIViewController
{

    //tableview object declaration
    @IBOutlet var objTableView: UITableView!
    
    //Array or Data collection initialization
    var names = [
        Symptoms(id: "1", title: "The common cold"),
        Symptoms(id: "2", title: "Gastroenteritis"),
        Symptoms(id: "3", title: "Salmonella infection"),
        Symptoms(id: "4", title: "Urinary tract infection"),
        Symptoms(id: "5", title: "Kidney stones"),
        Symptoms(id: "6", title: "Prostatitis"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //top title declaration
        self.navigationItem.title = "Symptoms"
        
        //allow cell position movement
        self.objTableView.isEditing = true;
        
        //allow cell selection while cell position movement
        self.objTableView.allowsSelectionDuringEditing  = true
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    
    //showacase cells with details
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = objTableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        let namestitle = names[indexPath.row]
        cell.textLabel?.text = namestitle.title;
        return cell;
    }
    
    //row data count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count;
    }
    
    //selection on cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailV = storyboard?.instantiateViewController(withIdentifier: "IntensityViewController") as? IntensityViewController
        self.navigationController?.pushViewController(detailV!, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let objMove =  self.names[sourceIndexPath.row]
        names.remove(at: sourceIndexPath.row)
        names.insert(objMove, at: destinationIndexPath.row)
    }
}
