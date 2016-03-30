//
//  ViewController.swift
//  Swift-Study-App
//
//  Created by Daniel Corona on 3/24/16.
//  Copyright © 2016 Daniel Corona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var conceptLabel: UILabel!
    @IBOutlet weak var timerTextbox: UILabel!
    
    var timer = NSTimer()
    var counter = 30
    var currentConcept = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        changeWord()
        
        conceptLabel.text! = currentConcept
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startTimer()
    {
        timerTextbox.text! = String(counter)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
    }
    
    func updateCounter(){
        if counter >= 0
        {
            counter -= 1
            
            
            if counter == -1
            {
                counter = 30
                changeWord()
            }
            
            timerTextbox.text! = String(counter)
        }
        
    }

    @IBAction func nextButton(sender: AnyObject) {
        counter = 30
        timerTextbox.text! = String(counter)
        
        changeWord()
        
    }
    
    func changeWord()
    {
        let allConcepts : [String] = ["Let vs. Var", "Computed Initializers", "Computed Variables", "Setter Observers", "Functions", "External Parameters", "Default Parameters", "Anonymous Functions", "Optional Chaining","Failable Initializers", "Casting", " Class Methods", " Extensions", "Enumeration", "Error Handling", "Dictionaries", "Conditional Binding", "Protocols", "Inheritance", "Structs", "Enums", "Classes", "Subscripts", "Setter Observers"]
        
        let randConcept = allConcepts[Int(rand()%23)]
        currentConcept = randConcept
        
        conceptLabel.text! = currentConcept
        
    }

}

