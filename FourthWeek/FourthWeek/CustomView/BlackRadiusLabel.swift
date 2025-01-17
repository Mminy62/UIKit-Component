//
//  BlackRadiusLabel.swift
//  FourthWeek
//
//  Created by 이민영 on 1/15/25.
//

import UIKit

//protocol SeSAC {
//    init()
//}
//
//class Mentor: SeSAC {
//    required init() {
//        print("Mentor init")
//    }
//}
//
//class Jack: Mentor {
//    required init() {
//        super.init()
//        print("Jack init")
//    }
//}


class BaseLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    // BaseLabel을 상속받은 것은, 더이상 required init coder를 없애기 위해
    @available(*, unavailable)
    required init?(coder: NSCoder) { // 어차피 실행 안되는데 숨길 수 없나?
        fatalError("init(coder:) has not been implemented")
    }
}

class PointButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class BlackRadiusLabel: BaseLabel {
    
    // 특정 컬러나 텍스트를 넣고싶을 때, 매개변수로 받을 때, Init 사용
    init(color: UIColor) {
        // super.init을 먼저 해줘야함
        super.init(frame: .zero) // == 아무 위치도 안잡은거랑 같은 말임
        font = .boldSystemFont(ofSize: 15)
        textColor = color
        backgroundColor = .black
        clipsToBounds = true
        layer.cornerRadius = 10
    }

    
    // 코드베이스로 코드를 구성할 때 호출되는 초기화 구문
    override init(frame: CGRect) { // UIView size를 위한 rect
        super.init(frame: frame)
        font = .boldSystemFont(ofSize: 15)
        textColor = .white
        backgroundColor = .black
        clipsToBounds = true
        layer.cornerRadius = 10
    }
    
    // 스토리보드로 구성할 때 호출되는 초기화 구문
    // 코드베이스로 클래스에 init을 쓸 때는 왜 항상 이 구문을 써야할까?
    // 프로토콜에 있는 init 이기 때문에 항상 써줘야하며, required가 붙는다!
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

//
