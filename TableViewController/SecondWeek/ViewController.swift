//
//  ViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 12/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recommendButton: UIButton!
    @IBOutlet weak var wordTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        // return 키를 눌렀을 때 키보드가 내려가게 자동으로 설정된 함수
        // 따로 키보드 내려가게 동작 설정 안해도 됨.
        
        print("return key tapped")
        // 왜 두번 불리는지??
        
        let text = wordTextField.text!.lowercased()
        // textField에서는 사실상 Nil을 가져올 수 없음. 아무 입력 없는 것은 "" 이지 nil은 아님
        // 특수하게 textfield에서는 비어있으면 Nil이 된다.
        // 공백 없애기
        if text.count == 0 || text.trimmingCharacters(in: .whitespaces).count == 0 { // whitespace, 빈 공백 인식
            // 빈 문자열 기준
            resultLabel.text = "검색 결과가 안나와요"
        } else if text == "jmt" {
            resultLabel.text = "완전 맛있음"
        } else {
            resultLabel.text = "\(text)로 입력했어요"
        }
    }
    
    @IBAction func labelTapped(_ sender: Any) {
        print(#function)
        resultLabel.isUserInteractionEnabled = true
//        recommendButton.isEnabled = false
        recommendButton.isUserInteractionEnabled = false
    }
    
    func aboutOptional() {
        var nickname: String? = "고래밥님"
        
        // 1. 조건문 활용 - 옵셔널 언래핑
        if nickname == nil{
            print("닉네임에 문제가 있어요.")
        } else {
            print("\(nickname!)으로 설정합니다.")
        }
        
        // 2. 옵셔널 바인딩 (if let / guard let)
        if let name = nickname {
            print("\(name)으로 설정합니다.")
        }
        
        guard let name = nickname else {
            print("닉네임에 문제가 있어요.")
            return // guard let에서 왜 return 타입을 쓰는가? 방어용
        }
        print("\(name)으로 설정합니다.")
        
        var age: Int? = 23
        if let age = age {
            print(age)
        }
        
        // 3. ??
        print(nickname ?? "손님")
        
        // 4. 옵셔널 체이닝
        // 물음표 ? 가 nil인지 아닌지 확인한 후, nil이면 다음 것을 실행 안함
        print(wordTextField.text?.count)
        // wordTextField.text가 없을 수 있기때문에
        
        if let text = wordTextField.text {
            print(text.count)
        }
        
        // 숫자가 아닙니다 -> 실시간으로 판단
    
    }
}

