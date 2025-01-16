//
//  Extension+Int.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import Foundation

extension Int {
    static let numberFormatter = NumberFormatter()
    
    func convertToDecimalString() -> String {
        Int.numberFormatter.numberStyle = .decimal
        return Int.numberFormatter.string(for: self)!
    }
}
