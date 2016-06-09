//
//  Media.swift
//  Confucianism in Korea
//
//  Created by Bridget Rossiter on 1/06/2016.
//  Copyright © 2016 Bridget Rossiter. All rights reserved.
//

import Foundation
import UIKit

class Media {
    var type: String
    //types: Seopyeonje, Chunhyang, Poetry, Peppermint Candy, Ode to my Father
    var questions: [String]?
    var answers: [[String]]?
    var correctAns: [[String]]?
    var isMovie: Bool?
    var imageMovies: [String]?
    
    
    
    init(mediaName type: String) {
        self.type = type;
        checkQuestion()
        
        
    }
    
    func checkQuestion () {
        
        switch (type) {
        case "Seopyeonje":
            questions = ["Q1", "Q2", "Q3", "Q4"]
            answers = [["Q1A1", "Q1A2", "Q1A3", "Q1A4"], ["Q2A1", "Q2A2", "Q2A3", "Q2A4"], ["Q3A1", "Q3A2", "Q3A3", "Q3A4"], ["Q4A1", "Q4A2", "Q4A3", "Q4A4"]]
            correctAns = [["Q1A1", "Q1A2"], ["Q2A1"], ["Q3A2"], ["Q4A1"]]
            isMovie = true;
            imageMovies = ["Test", "Test", "Test", "Test"]
            break;
        case "Chunhyang":
            questions = ["CQ1", "CQ2", "CQ3", "CQ4"]
            answers = [["CQ1A1", "CQ1A2", "CQ1A3", "QC1A4"], ["Q2A1", "Q2A2", "Q2A3", "Q2A4"], ["Q3A1", "Q3A2", "Q3A3", "Q3A4"], ["Q4A1", "Q4A2", "Q4A3", "Q4A4"]]
            correctAns = [["Q1A4"], ["Q2A3"], ["Q3A2"], ["Q4A1"]]
            isMovie = true;
            imageMovies = ["Test", "Test", "Test", "Test"]
            break;
        case "Poetry":
            questions = ["MQ1", "MQ2", "MQ3", "MQ4"]
            answers = [["MQ1A1", "MQ1A2", "MQ1A3", "MQ1A4"], ["Q2A1", "Q2A2", "Q2A3", "Q2A4"], ["Q3A1", "Q3A2", "Q3A3", "Q3A4"], ["Q4A1", "Q4A2", "Q4A3", "Q4A4"]]
            correctAns = [["Q1A4"], ["Q2A3"], ["Q3A2"], ["Q4A1"]]
            isMovie = true;
            imageMovies = ["Test", "Test", "Test", "Test"]
            break;
        case "Peppermint Candy":
            
            break;
        case "Ode to my Father":
            
            break;
        default:
            print("There has been an error. Check type input for Class Media")
            break;
        }

    }
  
    
    
    
    
}
