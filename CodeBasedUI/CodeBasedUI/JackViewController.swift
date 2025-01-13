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
        stackView.spacing = 15
        return stackView
    }()
    let joinButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    lazy var emailTextField = configureUITextField(text: "이메일 주소 또는 전화번호")
    lazy var passwordTextField = configureUITextField(text: "비밀번호")
    lazy var nicknameTextField = configureUITextField(text: "닉네임")
    lazy var positionTextField = configureUITextField(text: "위치")
    lazy var codeTextField = configureUITextField(text: "추천 코드 입력")
    
    let infoLabel = UILabel()
    let switchButton = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(nicknameTextField)
        stackView.addArrangedSubview(positionTextField)
        stackView.addArrangedSubview(codeTextField)
        stackView.addArrangedSubview(joinButton)
        view.addSubview(infoLabel)
        view.addSubview(switchButton)
        
        configureUI()
        configureLayout()
    }
    
    private func configureUI() {
        titleLabel.text = MenuButton.jack.title
        titleLabel.textColor = .red
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        stackView.backgroundColor = .clear
        
        infoLabel.text = "추가 정보 입력"
        infoLabel.textColor = .white
        switchButton.onTintColor = .red
        switchButton.setOn(true, animated: true)
        switchButton.thumbTintColor = .white
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
        }
        
        joinButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        configureLayoutTextField(textField: emailTextField)
        configureLayoutTextField(textField: passwordTextField)
        configureLayoutTextField(textField: nicknameTextField)
        configureLayoutTextField(textField: positionTextField)
        configureLayoutTextField(textField: codeTextField)
        
        infoLabel.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalTo(stackView)
            make.top.equalTo(stackView.snp.bottom).offset(15)
        }
        
        switchButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.trailing.equalTo(stackView)
            make.top.equalTo(stackView.snp.bottom).offset(15)
        }
    }
    
    private func configureLayoutTextField(textField: UITextField) {
        textField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.horizontalEdges.equalToSuperview()
            
        }
    }
    
    private func configureUITextField(text: String) -> UITextField {
        let textfield = UITextField()
        textfield.backgroundColor = .darkGray
        textfield.textColor = .white
        textfield.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textfield.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 5
        return textfield
    }

}
