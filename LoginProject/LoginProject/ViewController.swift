//
//  ViewController.swift
//  LoginProject
//
//  Created by 이민영 on 8/28/24.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextField: UIView = {
        let view = UIView() // 메모리에 올라가는 상태
        view.backgroundColor = UIColor.darkGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view // view를 emailTextField에 담는 것
    }() // 클로저 실행문 타입
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI() {
        view.addSubview(emailTextField) // 코드로 하려면 addSubview 함수로 올려주는 역할이 필요하다.
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }


}

