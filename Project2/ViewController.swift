//
//  ViewController.swift
//  Project2
//
//  Created by Miloslav on 26.05.19.
//  Copyright © 2019 Miloslav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttonOne: UIButton!
    @IBOutlet var buttonTwo: UIButton!
    @IBOutlet var buttonThree: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var round = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        buttonOne.layer.borderWidth = 1
        buttonTwo.layer.borderWidth = 1
        buttonThree.layer.borderWidth = 1
        
        buttonOne.layer.borderColor = UIColor.lightGray.cgColor
        buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
        buttonThree.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        round += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        buttonOne.setImage(UIImage(named:countries[0]), for: .normal)
        buttonTwo.setImage(UIImage(named:countries[1]), for: .normal)
        buttonThree.setImage(UIImage(named:countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased() + " - Score: \(score) - Round \(round)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if(sender.tag == correctAnswer) {
            score += 1
            title = "Correct"
        } else {
            score -= 1
            
            if(score < 0) {
                score = 0
            }
            
            title = "Wrong - The answer was \(sender.tag + 1)"
        }
        
        let ac = UIAlertController (title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        if(score >= 10){
            ac.addAction(UIAlertAction(title: "Close", style: .destructive, handler: nil))
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        
        present(ac,animated: true)
    }
    
}

