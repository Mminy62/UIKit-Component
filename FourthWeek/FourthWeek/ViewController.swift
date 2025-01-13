//
//  ViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/13/25.
//

/*
 1. 스토리보드에서 객체 얹히기
 2. 객체 레이아웃 잡기
 3. 아웃렛 연결하기
 4. 객체 속성 코드로 조절하기
 */

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // @IBOutlet var emailTextField: UITextField!
    // 1. 객체 선언
    let emailTextField = UITextField()
    let nameTextField = UITextField()
    let redView = UIView()
    let greenView = UIView()
    let grayView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoLayoutSnapKit2()
        
        // autoLayoutSnapKit()
        // autoLayoutAnchor()
        // autoLayoutConstraint()
        // frameBasedLayout()
        
    }
    
    func autoLayoutSnapKit2() {
        view.addSubview(redView)
        view.addSubview(grayView)
        redView.addSubview(greenView)
        
        redView.backgroundColor = .red
        grayView.backgroundColor = .gray
        greenView.backgroundColor = .green
        
        redView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
            // make.center.equalToSuperview()
        }
        
        greenView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
//        grayView.snp.makeConstraints { make in
////            make.edges.equalTo(redView).offset(50)
//            make.edges.equalTo(redView).inset(50)
//        }
    }
    
    func autoLayoutSnapKit() {
        // addSubView를 하고 나서 속성을 변경해야한다.
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(grayView)
        
        redView.backgroundColor = .red
        greenView.backgroundColor = .green
        grayView.backgroundColor = .gray
        
//        redView.snp.makeConstraints { make in
//            // make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
        
        // redView의 여백을 상하좌우로 주고 싶을 때
//        redView.snp.makeConstraints { make in
//            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(50)
//            make.bottom.trailing.equalTo(view.safeAreaLayoutGuide).offset(-50)
//        }
        
        redView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        
        
        
//        redView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(200)
//            make.width.equalTo(200)
//        }
//        
//        greenView.snp.makeConstraints { make in
//            make.center.equalTo(view.safeAreaLayoutGuide)
//            make.size.equalTo(200)
//        }
//        
//        grayView.snp.makeConstraints { make in
//            make.top.equalTo(greenView.snp.bottom).offset(50)
//            make.centerX.equalTo(greenView).offset(-100)
//            make.size.equalTo(200)
//        }
    }
    
    func autoLayoutAnchor() {
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func autoLayoutConstraint() {
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .gray
        // view safearea의 top을 기준으로, emailTextField의 top을 50으로 주겠다는 것
        let top = NSLayoutConstraint(item: emailTextField,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: view,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: 50)
        top.isActive = true
        
        let leading = NSLayoutConstraint(item: emailTextField,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1,
                           constant: 40)
        let trailig = NSLayoutConstraint(item: emailTextField,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -40)
        let height = NSLayoutConstraint(item: emailTextField,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .height,
                           multiplier: 1,
                           constant: 50)
        
        
        view.addConstraints([leading, trailig, height])
    }
    
    
    func frameBasedLayout() {
        // 2. addSubView 로 뷰 추가
        view.addSubview(emailTextField)
        // 3. 뷰의 위치와 크기 설정
        emailTextField.frame = CGRect(x: 50, y: 100, width: 300, height: 50)
        // 4. 객체 속성 코드로 조절
        emailTextField.backgroundColor = .gray
    }
}

