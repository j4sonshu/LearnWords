//
//  secondViewController.swift
//  tabbedViewSwiftParser
//
//  Created by Jason Shu on 12/28/17.
//  Copyright © 2017 Jason Shu. All rights reserved.
//

import UIKit

//var savedAnimals = [String] ()
var learnedWords = [String]()

//user default information
let defaults = UserDefaults.standard

//keep track of position
var secondDisplayIndex = 0

class secondViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    //table outlet
    @IBOutlet var secondTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table
        secondTableView.delegate = self
        secondTableView.dataSource = self
        
        //first time, just have a temp message
        if(defaults.object(forKey: "learnedWords") == nil) {
            learnedWords = [""]
            learnedWords.remove(at: 0)
        }
        else {
            learnedWords = defaults.object(forKey: "learnedWords") as! [String]
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("wordList: " + String(wordList.count))
        print("defaults count:" + String(defaults.object(forKey: "count") as! Int))
        
        //title information
        var percentage = String(format: "%.2f", Float(learnedWords.count)/Float((defaults.object(forKey: "count") as! Int)))
        navigationItem.title = "Learned Words (\(String(learnedWords.count))/\(defaults.object(forKey: "count") as! Int), \(percentage)%)"
        
        //deselect the selected row if any
        let selectedRow: IndexPath? = secondTableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            secondTableView.deselectRow(at: selectedRowNotNill, animated: true)
        }
        secondTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //table methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return learnedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.secondTableView.dequeueReusableCell(withIdentifier: "cellSecond") as UITableViewCell!
        
        //cell.selectionStyle = .none
        cell.textLabel?.text = learnedWords[indexPath.row]
        return cell
    }
    
    //segue, going back to exact spot after back button, ***keeps track of position
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secondDisplayIndex = indexPath.row
        performSegue(withIdentifier: "secondSegue", sender: self)
    }
    
}
