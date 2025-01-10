//
//  ViewController.swift
//  UpDownProject
//
//  Created by 이민영 on 1/9/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var textFieldLineView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        textFieldView.delegate = self
    }
    
    func configureUI() {
        view.backgroundColor = UIColor.main
        titleLabel.titleStyle(text: "UP DOWN")
        subTitleLabel.text = "GAME"
        subTitleLabel.textColor = .gray
        subTitleLabel.textAlignment = .center
        
        mainImageView.image = UIImage(named: "emotion1")
        mainImageView.backgroundColor = .clear
        mainImageView.contentMode = .scaleAspectFill
        
        textFieldView.textColor = .black
        textFieldView.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        textFieldView.backgroundColor = .clear
        textFieldView.borderStyle = .none
        textFieldView.textAlignment = .center
        
        textFieldLineView.backgroundColor = .white
        
        startButton.configureStyle(text: "시작하기")
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else { return }
        
        //refactor:  number 0 이하 입력안하도록 처리
        guard let text = textFieldView.text, let number = Int(text) else { return }
        nextVC.maxNumber = number
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.trimmingCharacters(in: .whitespaces).count == 0 {
            startButton.backgroundColor = .gray
            startButton.isEnabled = false
        } else {
            startButton.backgroundColor = .black
            startButton.isEnabled = true
        }
    }
        
}


// refactor: 키보드 내리기, 키보드 따라 화면 올리기

extension UILabel {
    func titleStyle(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        self.textColor = UIColor.black
        self.textAlignment = .center
    }
}

extension UIButton {
    func configureStyle(text: String) {
        self.titleLabel?.textAlignment = .center
        self.setTitle(text, for: .normal)
        self.backgroundColor = .gray
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
}

