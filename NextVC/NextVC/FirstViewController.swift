//
//  FirstViewController.swift
//  NextVC
//
//  Created by 이민영 on 12/1/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel()
    let backButton: UIButton = {
       let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
        makeAutoLayout()
    }
    func setUP() {
        mainLabel.text = someString // 옵셔널 바인딩 안해도, mainLabel 자체가 옵셔널로 선언되어 있음
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        
        view.backgroundColor = .gray
    }
    
    func makeAutoLayout() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backButtonTapped() {
        // 전 화면으로 돌아감
        dismiss(animated: true) {
            print("뒤로감")
        }
    }

}
