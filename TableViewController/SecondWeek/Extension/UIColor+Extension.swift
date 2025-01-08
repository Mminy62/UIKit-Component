//
//  UIColor+Extension.swift
//  SecondWeek
//
//  Created by 이민영 on 1/6/25.
//

import UIKit

extension UIColor {
    // 저장 프로퍼티, 인스턴스 프로퍼티
    static var jackColor = UIColor.red // 인스턴스롤 호출하는 영역이 없어서 애초에 저장 프로퍼티를 작성할 수 없다.(init)
    static var backColor = UIColor.black
    
    // 단, static 은 가능
    // 저장 프로퍼티 == 인스턴스 프로퍼티 라고 많이 얘기함
    
    // 연산 프로퍼티는 공간 없어도 되기 때문에, 작성 가능
    var denColor: UIColor {
        return UIColor.red
    }
}

