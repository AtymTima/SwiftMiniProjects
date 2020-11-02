//
//  MainView.swift
//  DiceProgrammatic
//
//  Created by  Тима on 11/2/20.
//  Copyright © 2020 atymtima. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    func setupDiceViewController(){
        let sideMargins : CGFloat = 20
        view.addSubview(diceContentView)
        diceContentView.addSubview(diceImageLeft)
        diceContentView.addSubview(diceImageRight)
        diceContentView.translatesAutoresizingMaskIntoConstraints = false
        diceContentView.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
        diceContentView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: sideMargins).isActive = true
        diceContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -sideMargins).isActive = true
        diceContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        setupDiceImages()
        setupDiceRollBtnView()
    }
    
    func setupDiceImages(){
        diceImageLeft.leftAnchor.constraint(equalTo: diceContentView.leftAnchor).isActive = true
        diceImageRight.rightAnchor.constraint(equalTo: diceContentView.rightAnchor).isActive = true
        setupImageView(currentImageView: diceImageLeft)
        setupImageView(currentImageView: diceImageRight)
    }
    
    func setupImageView(currentImageView : UIImageView){
        currentImageView.topAnchor.constraint(equalTo: diceContentView.topAnchor).isActive = true
        currentImageView.bottomAnchor.constraint(equalTo: diceContentView.bottomAnchor).isActive = true
        currentImageView.widthAnchor.constraint(equalTo: currentImageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setupDiceRollBtnView(){
        view.addSubview(rollTheDiceBtnView)
        rollTheDiceBtnView.addSubview(rollTheDiceButton)
        rollTheDiceBtnView.translatesAutoresizingMaskIntoConstraints = false
        rollTheDiceBtnView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rollTheDiceBtnView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rollTheDiceBtnView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        rollTheDiceBtnView.topAnchor.constraint(equalTo: diceContentView.bottomAnchor).isActive = true
        setupDiceRollButton()
    }
    
    func setupDiceRollButton(){
        let buttonHeight : CGFloat = 40
        rollTheDiceButton.translatesAutoresizingMaskIntoConstraints = false
        rollTheDiceButton.centerXAnchor.constraint(equalTo: rollTheDiceBtnView.centerXAnchor).isActive = true
        rollTheDiceButton.centerYAnchor.constraint(equalTo: rollTheDiceBtnView.centerYAnchor).isActive = true
        rollTheDiceButton.backgroundColor = .black
        rollTheDiceButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        rollTheDiceButton.widthAnchor.constraint(equalToConstant: buttonHeight * 2.5).isActive = true
        rollTheDiceButton.isEnabled = true
        
    }
}
