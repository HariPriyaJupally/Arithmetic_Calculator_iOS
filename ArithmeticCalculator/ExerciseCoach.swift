//
//  ExerciseCoach.swift
//  ArithmeticCalculator
//
//  Created by Jupally,Hari Priya on 4/15/19.
//  Copyright © 2019 Jupally,Hari Priya. All rights reserved.
//

import Foundation

struct ExerciseCoach {
    
    static let sports:[String:Double] = ["Bicycling" : 8.0, "Jumping rope" : 12.3, "Running - slow" : 9.8, "Running - fast" : 23.0, "Tennis" : 8.0, "Swimming" : 5.8]
    static let kg = 2.2
    //let met = sports["Bicycling"]!
    
    static func energyConsumed(during: String,weight: Double,time: Int) -> Double {
        
        let met = sports[during]!
        
        let energyConsumed = (met * 3.5 * weight/2.2)/200 * Double(time)
        
        return energyConsumed
        
    }
    
    static func timeToLose1Pound(during: String,weight: Double) -> Double {
        
        let timeToLoseOnePound = Double(3500)/(energyConsumed(during: during, weight: weight, time: 1))
        
        return timeToLoseOnePound
    }
    
}
