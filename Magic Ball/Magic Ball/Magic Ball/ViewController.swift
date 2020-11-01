//
//  ViewController.swift
//  Magic Ball
//
//  Created by  Тима on 11/1/20.
//  Copyright © 2020 atymtima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballAnswerView: UIImageView!
    
    let ballAnswers = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomIndex : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func askButtonPressed(_ sender: Any)
    {
        getRandomAnswer()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        getRandomAnswer()
    }
    
    func getRandomAnswer()
    {
        randomIndex = Int(arc4random_uniform(5))
        ballAnswerView.image = UIImage(named: ballAnswers[randomIndex])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
}

