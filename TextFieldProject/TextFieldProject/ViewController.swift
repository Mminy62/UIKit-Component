//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 이민영 on 8/27/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.default
        textField.placeholder = "Enter your email"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
//        textField.returnKeyType = .next // keyboard enter 버튼 이름 변경
        textField.becomeFirstResponder()
    }
    
    
    // 화면 탭을 감지하는 코드 (화면 탭할 때마다 키보드 내리기)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
//        textField.resignFirstResponder()
    }
    
    // 텍스트필드의 입력을 해도 될지/말지 정해주는 것 (편집 여부 허락)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        print(#function)
        return true
    }
    
    // 텍스트필드 입력이 시작되는 시점을 알려주는 함수
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print(#function)
          print("유저가 텍스트필드의 입력을 시작했다")
    }

    // 텍스트필드의 clear 버튼 동작할때, return false 이면 안지워짐
    // 어떤 조건일 때 지워지게 할 것인지,
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        print(#function)
        return true
    }
    
    // 텍스트필드 글자 내용이 (한글자씩) 입력되거나 지워질 때마다 호출 되는 것
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil { // 숫자로 변환이 되면 nil이 아님
            return false // 숫자로 변환되면 입력 행위 금지
        }
        // 10 글자 이상 되는 것을 막는 것
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        // range.length 사용자에 의해 편집될 텍스트의 길이
        // 텍스트 입력 시, 기존 텍스트를 변경하지 않기 때문에 range.length: 0
        // 텍스트 1개 삭제 시, range.length: 1
        
        return newLength <= 10
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할 것인지 말 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 끝날 때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(#function)
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
}

