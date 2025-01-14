//
//  Extension+Date.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/14/25.
//

import Foundation

extension Date {
    static let dateformatter = DateFormatter()
    
    func convertToYesterday() -> Date {
        return self - 86400
    }
    
    func convertToString(format: String) -> String {
        let dateformatter = Date.dateformatter
        dateformatter.dateFormat = format
        dateformatter.locale = Locale(identifier: "ko_KR")
        return dateformatter.string(from: self)
    }
}
