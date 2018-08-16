//
//  secondWordViewController.swift
//  tabbedViewSwiftParser
//
//  Created by Jason Shu on 1/3/18.
//  Copyright © 2018 Jason Shu. All rights reserved.
//

import UIKit

class secondWordViewController: UIViewController {

    //text outlet
    @IBOutlet weak var wordInformation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //button information
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Unlearn", style: .plain, target: self, action: #selector(unlearnWord))
        
        //text information
        wordInformation.text = learnedWords[secondDisplayIndex]
        
        //view information
        let separated = learnedWords[secondDisplayIndex].components(separatedBy: "-")
        let title = separated[0].trimmingCharacters(in: .whitespacesAndNewlines)
        self.navigationItem.title = title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()   
    }
    
    @objc func unlearnWord () {
        //index of the word in learnedWords
        if let index = learnedWords.index(of: learnedWords[secondDisplayIndex]) {
            
            //if unlearning, add it back to the wordList so it can show up again
            //wordList.append(learnedWords[secondDisplayIndex])
            
            learnedWords.remove(at: index)
            defaults.set(learnedWords, forKey: "learnedWords")
        }
        self.navigationController?.popToRootViewController(animated: true)
     }
}
