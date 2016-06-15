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
            imageMovies = ["NA", "NA", "NA", "NA"]
            break;
        case "Welcome to Dongmakol":
            questions = ["What was the knowledge that allowed the South Korean and North Korean soliders to rectify their hearts.", "What does rectifiying their hearts lead to?"]
            answers = [["that they are stronger than the other side", "that they are not so different", "that they are winning the war", "none of the above"], ["peace between the soliders", "they resolve to fight the other side", "none of the above"]]
            correctAns = [["that they are not so different"], ["peace between the soliders"]]
            isMovie = true;
            imageMovies = ["NA", "NA", "NA", "NA"]
            break;
        case "Poetry":
            questions = ["MQ1", "MQ2", "MQ3", "MQ4"]
            answers = [["MQ1A1", "MQ1A2", "MQ1A3", "MQ1A4"], ["Q2A1", "Q2A2", "Q2A3", "Q2A4"], ["Q3A1", "Q3A2", "Q3A3", "Q3A4"], ["Q4A1", "Q4A2", "Q4A3", "Q4A4"]]
            correctAns = [["Q1A4"], ["Q2A3"], ["Q3A2"], ["Q4A1"]]
            isMovie = true;
            imageMovies = ["NA", "NA", "NA", "NA"]
            break;
        case "Peppermint Candy":
            
            break;
        case "Ode to My Father":
            questions = ["What Confucianism Values is Deok-soo displaying? \n Select 1 or more" ,
                         "The Master said: \"A young man should serve his parents at home and be respectful to elders outside his home. He should be earnest and truthful, loving all, but become intimate with his innate good-heartedness. After doing this, if he has energy to spare, he can study literature and the arts.\" (The Analects of Confucius, 1:6) \n What is the equivalent to literature and the arts for Deok-soo (in that it must be done after filial Piety)\n Select 1?",
                         "\"In serving his parents, a filial son reveres them in daily life; he makes them happy while he nourishes them; he takes anxious care of them in sickness; he shows great sorrow over their death that was for him; and he sacrifices to them with solemnity.\"\nWhich of these is Youngja telling Deak-soo he is doing too much of the most? \n Select 1",
                         "Which Confucian Relationship does 'Ode to My Father' emphasize the most? \n Select 1"]
            answers = [["Sangmin", "Filial Piety", "The Father-Son Relation"],
                       ["Going to Korea Maritime University", "Going to Germany to work in the coal mines", "Fighting in the Vietnam War", "Participating in the 'Does Anyone Know this Person' program"],
                       ["he shows great sorrow over their death that was for him", "he sacrifices to them with solemnity", "he takes anxious care of them in sickness", "reveres them in daily life"],
                       ["Ruler to Minister", "Parent to Child", "Husband to Wife", "Older Brother to Younger Brother", "Among Friends"]]
            correctAns = [["Filial Piety", "The Father-Son Relation"], ["Going to Korea Maritime University"], ["he sacrifices to them with solemnity"], ["Parent to Child"]]
            isMovie = true;
            imageMovies = ["Ode_Q1", "NA", "Ode_Q3", "NA"]

            
            break;
        default:
            print("There has been an error. Check type input for Class Media")
            break;
        }

    }
  
    
    
    
    
}
