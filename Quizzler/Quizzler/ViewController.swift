//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var chosenAnswer : Bool = false
    var questionIndex : Int = 0
    var currentScore: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        switch sender.tag {
        case 1:
            chosenAnswer = true
        case 2:
            chosenAnswer = false
        default:
            chosenAnswer = true
            print("something went wrong...")
        }
        checkAnswer()
    }
    
    
    func updateUI() {
        let currentQuestion = allQuestions.listOfQuestions[questionIndex]
        questionLabel.text = currentQuestion.questionText
        
        scoreLabel.text = "\(currentScore)"
        progressLabel.text = "\(questionIndex + 1) / \(allQuestions.listOfQuestions.count)"
        progressBarWidthConstraint.constant = (view.frame.size.width / CGFloat(allQuestions.listOfQuestions.count)) * CGFloat(questionIndex + 1)
    }
    

    func nextQuestion() {
        questionIndex += 1
        if (questionIndex >= allQuestions.listOfQuestions.count)
        {
            let alertMessage = UIAlertController(title: "Congrats", message: "You finished the Quiz. Wanna start over?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alertMessage.addAction(alertAction)
            present(alertMessage, animated: true, completion: nil)
            return
        }
        updateUI()
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.listOfQuestions[questionIndex].answer
        switch chosenAnswer {
        case correctAnswer:
            currentScore += 1
            ProgressHUD.showSuccess("Right")
        default:
            ProgressHUD.showError("Wrong!")
        }
        nextQuestion()
    }
    
    
    func startOver() {
        questionIndex = 0
        currentScore = 0
        updateUI()
    }
    

    
}
