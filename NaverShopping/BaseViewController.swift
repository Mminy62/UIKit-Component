//
//  BaseViewController.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import UIKit

class BaseViewController: UIViewController {
    // 왜 이것만 넣으면 오류가 나는지..? 빌드 에러
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        view.backgroundColor = .black
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() { }
    func configureLayout() { }
    func configureView() { }
}
