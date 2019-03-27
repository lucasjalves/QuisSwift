//
//  Question.swift
//  Quizzler
//
//  Created by Lucas on 3/26/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    init(text :String, ans: Bool){
        textQuestion = text
        answer = ans
    }
    let textQuestion: String
    let answer: Bool
}
