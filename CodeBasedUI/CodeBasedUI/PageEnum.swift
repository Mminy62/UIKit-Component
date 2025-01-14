//
//  PageEnum.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/14/25.
//

import UIKit

// objc 함수의 파라미터로 enum을 쓰려면, enum에도 @objc와 타입이 붙어야한다... 왜?
@objc enum PageButton: Int, CaseIterable {
    case jack
    case npay
    case rank
    case lotto
    
    var title: String {
        switch self {
        case .jack:
            "JACKFLIX"
        case .npay:
            "NPay"
        case .rank:
            "Rank"
        case .lotto:
            "Lotto"
        }
    }
    
    var vc: UIViewController {
        switch self {
        case .jack:
            return JackViewController()
        case .npay:
            return NpayViewController()
        case .rank:
            return RankViewController()
        case .lotto:
            return LottoViewController()
        }
    }
}
