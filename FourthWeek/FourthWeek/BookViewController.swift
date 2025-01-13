//
//  BookViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class BookViewController: UIViewController {

    lazy var button = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.titleLabel?.textColor = .black
        button.setTitle("BookButton", for: .normal)
        // var button에서도 selector(nextButtonTapped)를 사용했었는데, ()로 실행하는게 아니라, 함수와의 연결 정도이기에 문제가 안됨
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(#function)
        configureButton()
    }
    
    func configureButton() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
    }
    
    @objc func nextButtonTapped() {
        print(#function)
        let vc = CodeCollectionViewController()
        present(vc, animated: true)
    }

    
//    func makeMyButton() -> UIButton {
//        let button = UIButton()
//        button.setTitle("BookButton", for: .normal)
//        button.tintColor = .black
//        button.backgroundColor = .yellow
//        return button
//    }
//    
}
