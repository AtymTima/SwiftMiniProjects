//
//  ViewController.swift
//  DiceProgrammatic
//
//  Created by  Тима on 11/1/20.
//  Copyright © 2020 atymtima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let diceContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let diceImageLeft: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dice1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let diceImageRight: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dice2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let rollTheDiceBtnView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let rollTheDiceButton: UIButton = {
        let button = UIButton()
        button.setTitle("Roll", for: .normal)
        button.addTarget(self, action: #selector(rollTheDiceButtonPressed), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    @objc func rollTheDiceButtonPressed(sender: UIButton!){
        print("pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDiceViewController()
        view.backgroundColor = .blue
    }


}

