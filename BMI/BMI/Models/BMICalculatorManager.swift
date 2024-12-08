//
//  BMICalculatorManager.swift
//  BMICalculatorManager
//
//  Created by 이민영 on 12/8/24.
//

import Foundation
import UIKit

struct BMICalculatorManager {
    private var bmi: BMI?
    
    mutating func getBMIResult(height: String, weight: String) -> BMI {
        calculateBMI(height: height, weight: weight)
        return bmi ?? BMI(bmi: 0.0, adviceString: "문제발생", adviceColor: .white)
    }

    mutating private func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(bmi: 0.0, adviceString: "문제발생", adviceColor: .white)
            return
        }
        var bmiNum = w / (h * h) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        var color = UIColor.white
        switch bmiNum {
        case ..<18.6:
            color = UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            color = UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            color = UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            color = UIColor.black
        }
        
        var advice = ""
        switch bmiNum {
        case ..<18.6:
            advice = "저체중"
        case 18.6..<23.0:
            advice = "표준"
        case 23.0..<25.0:
            advice = "과체중"
        case 25.0..<30.0:
            advice = "중도비만"
        case 30.0...:
            advice = "고도비만"
        default:
            advice = ""
        }
        
        bmi = BMI(bmi: bmiNum, adviceString: advice, adviceColor: color)
    }
}
