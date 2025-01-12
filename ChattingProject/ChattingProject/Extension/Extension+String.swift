//
//  Extension+String.swift
//  ChattingProject
//
//  Created by 이민영 on 1/11/25.
//

import Foundation

extension String {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
    
    func convertToDateString(formatString: String) -> String{
        let formatter = String.dateFormatter
        formatter.locale = Locale(identifier:"ko_KR")
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateData = String.dateFormatter.date(from: self)
        formatter.dateFormat = formatString
        let date = dateData ?? Date()
        let convertString = formatter.string(from: date)
        return convertString
    }
}
