//
//  BaseView.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import UIKit
import SnapKit

class BaseButtonView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() { }
    func configureLayout() { }
    func configureView() {
        backgroundColor = .black
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
