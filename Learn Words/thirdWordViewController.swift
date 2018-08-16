//
//  wordViewController.swift
//  tabbedViewSwiftParser
//
//  Created by Jason Shu on 12/30/17.
//  Copyright © 2017 Jason Shu. All rights reserved.
//

import UIKit

class thirdWordViewController: UIViewController {
    
    //text outlet
    @IBOutlet var wordInformation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //text information, button information
        if(filtering) {
            wordInformation.text = filteredDictionary[sections[thirdDisplaySection]]?[thirdDisplayIndex]
            
            if(!learnedWords.contains(filteredDictionary[sections[thirdDisplaySection]]![thirdDisplayIndex])) {
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Learn", style: .plain, target: self, action: #selector(learnWord))
            }
            else {
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Unlearn", style: .plain, target: self, action: #selector(unlearnWord))
            }
            
            //view information
            let separated = filteredDictionary[sections[thirdDisplaySection]]![thirdDisplayIndex].components(separatedBy: "-")
            let title = separated[0].trimmingCharacters(in: .whitespacesAndNewlines)
            self.navigationItem.title = title
        }

        else {
            wordInformation.text = dictionary[sections[thirdDisplaySection]]?[thirdDisplayIndex]
            
            if(!learnedWords.contains(dictionary[sections[thirdDisplaySection]]![thirdDisplayIndex])) {
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Learn", style: .plain, target: self, action: #selector(learnWord))
            }
            else {
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Unlearn", style: .plain, target: self, action: #selector(unlearnWord))
            }
            
            //view information
            let separated = dictionary[sections[thirdDisplaySection]]![thirdDisplayIndex].components(separatedBy: "-")
            let title = separated[0].trimmingCharacters(in: .whitespacesAndNewlines)
            self.navigationItem.title = title
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func learnWord () {
        //if learning, add to learnedWords
        //no need to remove from wordList, since firstview already constantly checks to remove learned words from wordlist
        if(filtering) {
            learnedWords.insert(filteredDictionary[sections[thirdDisplaySection]]![thirdDisplayIndex], at: 0)
        }
        else {
            learnedWords.insert(dictionary[sections[thirdDisplaySection]]![thirdDisplayIndex], at: 0)
        }
        
        defaults.set(learnedWords, forKey: "learnedWords")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func unlearnWord () {
        //if unlearning, remove from learnedWords
        if(filtering) {
            if let index = learnedWords.index(of: filteredDictionary[sections[thirdDisplaySection]]![thirdDisplayIndex]) {
                //wordList.append(filteredDictionary[sections[thirdDisplaySection]]![thirdDisplayIndex])
                
                learnedWords.remove(at: index)
            }
        }
        else {
            if let index = learnedWords.index(of: dictionary[sections[thirdDisplaySection]]![thirdDisplayIndex]) {
                //wordList.append(dictionary[sections[thirdDisplaySection]]![thirdDisplayIndex])
                
                learnedWords.remove(at: index)
            }
        }
        defaults.set(learnedWords, forKey: "learnedWords")
        self.navigationController?.popToRootViewController(animated: true)
    }
}
