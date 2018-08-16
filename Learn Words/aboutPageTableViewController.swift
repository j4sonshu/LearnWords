//
//  aboutPageTableViewController.swift
//  Scuttle
//
//  Created by Jason Shu on 1/15/18.
//  Copyright © 2018 Jason Shu. All rights reserved.
//

import UIKit

class aboutPageTableViewController: UITableViewController {
    
    //table outlet
    @IBOutlet var aboutPageTableView: UITableView!
    
    //label and button outlets
    @IBOutlet weak var howToLabel: UILabel!
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        let clearAlert = UIAlertController(title: "Clear ALL Learned Words", message: "Are you sure?\n All learned words will be lost.", preferredStyle: UIAlertControllerStyle.alert)
        
        clearAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            learnedWords.removeAll()
            defaults.set(learnedWords, forKey: "learnedWords")
        }))
        
        clearAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("nothing")
        }))
        present(clearAlert, animated: true, completion: nil)
    }
    
    @IBAction func writeReviewButton(_ sender: UIButton) {
        let reviewAlert = UIAlertController(title: "Write a Review!", message: "Tapping \"Ok\" will open the App Store.", preferredStyle: UIAlertControllerStyle.alert)
        
        reviewAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            if let url = URL(string: "itms-apps:itunes.apple.com/us/app/apple-store/id\(1332162488)?mt=8&action=write-review") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        
        reviewAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("nothing")
        }))
        present(reviewAlert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var historyLabel: UILabel!
    
    @IBOutlet weak var contactMeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //somehow removes extra lines at bottom
        self.aboutPageTableView.tableFooterView = UIView()
        //removes table line at very bottom of page
        self.aboutPageTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
        //label information
        //how to use
        howToLabel.text = "\u{2022} In the \"Words to Learn\" tab, ten random words are displayed. Tapping the button in the upper right-hand corner refreshes the list for ten new words.\n\u{2022} In the \"Learned Words\" tab, your learned words are displayed. To learn a word, tap on any word to display it in a larger view. In the upper right-hand corner, you can tap \"Learn\" to learn the word. To unlearn a word, tap on the word again, and tap \"Unlearn\". The title of this tab also displays a fraction and percentage of your learned words out of all the words.\n\u{2022} In the \"All Words\" tab, you can navigate through all the words by using the scroll bar on the right, or search for a specific word using the search bar. A learned word will have a checkmark in its cell to indicate that it has been already learned."
        howToLabel.padding = UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
        
        //history
        historyLabel.text = "\u{2022} This project initially started as something I wanted to cross off on my bucket list: to learn ten new vocabulary words a day to help improve my own vocabulary.\n\u{2022} I also wanted to create an iOS app, so I decided to complete both tasks at once: create an app to help me improve my vocabulary.\n\u{2022} Currently, Scuttle only pulls words from 3 sites, but more words will be added in the future!\n\u{2022} The name of the app, Scuttle, is an inside joke between a good friend of mine, and is also a synonym of the word \"bucket\", in reference to how the app stemmed from an item on my bucket list."
        historyLabel.padding = UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
        
        //contact me
        contactMeLabel.text = "If you have any other feedback or comments, feel free to email me at shumatt190@gmail.com."
        contactMeLabel.padding = UIEdgeInsets(top: 10, left: 2, bottom: 10, right: 2)
        
        
        //autosizing text in table cell
        aboutPageTableView.rowHeight = UITableViewAutomaticDimension
        aboutPageTableView.estimatedRowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //table methods
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}
