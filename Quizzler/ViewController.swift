//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    //Place your instance variables here
    var allQuestion = QuestionBank()
    var pickedanswer = false
    var progress = 1
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = allQuestion.list[progress-1].questions
        updateUI()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedanswer = true
        }
        else{
            pickedanswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        progressLabel.text = "\(progress)/13"
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(progress)
      
    }
    

    func nextQuestion() {
        if progress < 14 {
            questionLabel.text = allQuestion.list[progress-1].questions
            updateUI()
        }
        else {
            
            let alert = UIAlertController(title: "game over", message: "you have compeleted the quiz", preferredStyle: UIAlertController.Style.alert)
            let restart = UIAlertAction(title: "restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restart)
            present(alert, animated: true ,completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        if pickedanswer == allQuestion.list[progress - 1].answer{
            ProgressHUD.showSuccess("correct")
            progress = progress + 1
            scoreLabel.text = "\(progress - 1)"
            nextQuestion()
            
        }
        
        else {
             AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            ProgressHUD.showError("Wrong!")
        }
    }
    
    
    func startOver() {
        progress = 1
        viewDidLoad()
    }

    
}
