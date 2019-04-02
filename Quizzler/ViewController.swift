//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank();
    var pickedAnswer: Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    var width : Int = 24
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(question: allQuestions.list[0])
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        let q = allQuestions.list[questionNumber]
        let resposta = checkAnswer(q: q, ans: sender.tag == 1)
        if(resposta){
            nextQuestion()
            if(questionNumber <= 12 &&  questionNumber != 0){
                 updateUI(question: allQuestions.list[questionNumber])
                    ProgressHUD.showSuccess("Voce acertou")
            }
        }else{
            ProgressHUD.showError("Voce errou!")
            startOver()
            SoundPlayerUtil.tocarSom(forResource: "note8", ofType: "mp3")
        }
    }
    
    
    func updateUI(question: Question) {
        questionLabel.text = question.textQuestion
        progressLabel.text = "\(questionNumber + 1)/13"
        scoreLabel.text = "Score: \(100 * (questionNumber))"
        progressBar.frame.size.width = (view.frame.size.width) / 13 * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        questionNumber = questionNumber + 1
        if(questionNumber == 13){
            abrirAlerta()
        }
    }
    
    
    func checkAnswer(q : Question, ans: Bool) -> Bool {
        return q.answer == ans
    }
    
    
    func startOver() {
        self.questionNumber = 0;
        self.updateUI(question: self.allQuestions.list[0])
    }
    
    func abrirAlerta(){
        let alert = UIAlertController(title: "Voce venceu!!!!", message: "Clique em ok para reiniciar o quiz!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.startOver()
        }))
        present(alert, animated: true, completion: nil)
    }

    
}
