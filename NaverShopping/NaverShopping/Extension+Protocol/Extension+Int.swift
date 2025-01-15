//
//  Extension+Int.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import Foundation

extension Int {
    func convertToDecimalString() -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self)!
    }
}
