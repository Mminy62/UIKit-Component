//
//  SortButtonView.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import UIKit
import SnapKit

class SortButtonView: BaseButtonView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        configureView()
    }
    
    override func configureLayout() {
        self.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
    }
    
    override func configureView() {
        setTitleColor(.white, for: .normal)
        setTitleColor(.black, for: .selected)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 10
        layer.borderWidth = 1
    }
    
}
