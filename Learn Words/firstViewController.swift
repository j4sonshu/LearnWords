//
//  firstViewController.swift
//  tabbedViewSwiftParser
//
//  Created by Jason Shu on 12/28/17.
//  Copyright © 2017 Jason Shu. All rights reserved.
//

import UIKit

//keep track of position
var firstDisplayIndex = 0

class firstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //table outlet
    @IBOutlet var firstTableView: UITableView!
    
    //button outlet
    @IBAction func refreshButton(_ sender: UIBarButtonItem!) {
        //have to set wordList
        wordList.shuffle()
        defaults.set(wordList, forKey: "wordList")
        firstTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //wordlist init
        wordList = defaults.object(forKey: "wordList") as! [String]
        
        //table
        firstTableView.delegate = self
        firstTableView.dataSource = self
        
        //somehow removes extra lines at bottom
        self.firstTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //accounting for updates, wordList is replenished while learnedWords stay the same
        //basically forever cleaning up wordlist, even if i update
        for element in wordList {
            if(learnedWords.contains(element)) {
                wordList.remove(at: wordList.index(of: element)!)
            }
        }
        
        // deselect the selected row if any
        let selectedRow: IndexPath? = firstTableView.indexPathForSelectedRow
        if let selectedRowNotNill = selectedRow {
            firstTableView.deselectRow(at: selectedRowNotNill, animated: true)
        }
        
        firstTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //table methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //10 if there are more than 10 words to learn, else just return how many there are left
        if(wordList.count >= 10) {
            return 10
        }
        return wordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.firstTableView.dequeueReusableCell(withIdentifier: "cellFirst") as UITableViewCell!
        
        cell.textLabel?.text = wordList[indexPath.row]
        
        return cell
    }
    
    //segue, going back to exact spot after back button, ***keeps track of position
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        firstDisplayIndex = indexPath.row
        performSegue(withIdentifier: "firstSegue", sender: self)
    }
}
