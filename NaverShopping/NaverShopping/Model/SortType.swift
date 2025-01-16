//
//  SortType.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import Foundation

enum SortType: String, CaseIterable {
    case sim
    case date
    case dsc
    case asc
    
    var title: String {
        switch self {
        case .sim:
            "정확도"
        case .date:
            "날짜순"
        case .dsc:
            "가격높은순"
        case .asc:
            "가격낮은순"
        }
    }
}
