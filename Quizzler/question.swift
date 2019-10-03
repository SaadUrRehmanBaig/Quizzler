//
//  File.swift
//  Quizzler
//
//  Created by Anas on 20/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct Question{
    
    let questions : String
    let answer : Bool
    init(text : String ,ans : Bool) {
        questions = text
        answer = ans
    }
    
}
