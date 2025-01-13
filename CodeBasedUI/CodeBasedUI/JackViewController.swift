//
//  JackViewController.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class JackViewController: UIViewController {
    
    let titleLabel = UILabel()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    let nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "이메일"
        textfield.backgroundColor = .systemGray6
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        stackView.addSubview(nameTextField)
        
        configureUI()
        configureLayout()
    
    }
    
    private func configureUI() {
        titleLabel.text = MenuButton.jack.title
        titleLabel.textColor = .red
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        
        stackView.backgroundColor = .blue
        
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(200)
        }
        
        configuireTextField(textField: nameTextField)
    }
    
    private func configuireTextField(textField: UITextField) {
        textField.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.horizontalEdges.equalToSuperview()
        }
    }

}
