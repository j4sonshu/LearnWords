//
//  firstWordViewController.swift
//  tabbedViewSwiftParser
//
//  Created by Jason Shu on 1/2/18.
//  Copyright © 2018 Jason Shu. All rights reserved.
//

import UIKit

class firstWordViewController: UIViewController {

    //text outlet
    @IBOutlet var wordInformation: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text information
        wordInformation.text = wordList[firstDisplayIndex]
        
        //button information
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Learn", style: .plain, target: self, action: #selector(learnWord))
        
        //view information
        let separated = wordList[firstDisplayIndex].components(separatedBy: "-")
        let title = separated[0].trimmingCharacters(in: .whitespacesAndNewlines)
        self.navigationItem.title = title
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func learnWord () {
        //add to learnWords
        learnedWords.insert(wordList[firstDisplayIndex], at: 0)
        defaults.set(learnedWords, forKey: "learnedWords")
        
        self.navigationController?.popToRootViewController(animated: true)
    }
}
