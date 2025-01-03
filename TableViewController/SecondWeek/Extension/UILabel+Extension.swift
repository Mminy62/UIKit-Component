//
//  UILabel+Extension.swift
//  SecondWeek
//
//  Created by 이민영 on 1/2/25.
//

import Foundation
import UIKit

extension UILabel {
    func setPrimaryLabel(_ title: String? = nil) {
        self.textColor = UIColor.blue
        self.font = .boldSystemFont(ofSize: 14)
        if let title {
            self.text = title
        }
    }
}
