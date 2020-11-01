//
//  ViewController.swift
//  Dice Roll
//
//  Created by  Тима on 10/14/20.
//  Copyright © 2020 atymtima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rollImageViewLeft: UIImageView!
    @IBOutlet weak var rollImageViewRight: UIImageView!
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    var randomDiceIndex1: Int = 0
    var randomDiceIndex0: Int = 0
    
    override func viewDidLoad()
    {
        randomlyRollTheDice()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton)
    {
        randomlyRollTheDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)
    {
        randomlyRollTheDice()
    }
    
    func randomlyRollTheDice()
    {
        randomDiceIndex0 = Int(arc4random_uniform(6))
        randomDiceIndex1 = Int(arc4random_uniform(6))
        rollImageViewLeft.image = UIImage(named: diceArray[randomDiceIndex0])
        rollImageViewRight.image = UIImage(named: diceArray[randomDiceIndex1])
    }
    
}

