//
//  CalculatorLogic.swift
//  Calculate
//
//  Created by 순진이 on 2022/03/21.
//

import UIKit

class CalculateLogic {
    
    let number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        switch symbol {
        case "+/-":
            return number * -1
        case "AC":
            return 0
        case "%":
            return number * 0.01
        default:
            return nil
        }
    }
}
