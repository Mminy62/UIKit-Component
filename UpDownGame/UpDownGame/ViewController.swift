//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이민영 on 6/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    @IBOutlet var buttonPads: [UIButton]!
    // 함수안의 지역변수로 만들면 -> 메모리에서 스택프레임이 실행되는 동안에만 생겼다가 없어진다.
    var comNumber = Int.random(in: 1...10)
    var userNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 메인레이블에 "선택하세요"
        // 2) 숫자리에블은 ""
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        
        for button in buttonPads {
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자 가져오기
        guard let inputNumber = sender.currentTitle else { return }
        // 2) 숫자 레이블이 변하도록 (숫자에 따라)
        numberLabel.text = inputNumber
        // 3) 선택한 숫자를 변수에다가 저장(선택)
        guard let num = Int(inputNumber) else { return }
        userNumber = num
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // userNumber 전역변수 없이 사용하는 방법
        // guard let myNumString = numberLabel.text else { return }
        // 타입 변환
        // guard let userNumber = Int(myNumString) else { return }
        
        
        // 1) 컴퓨터와 나의 숫자를 선택해서 비교 up / down / bingo (메인레이블)
        if comNumber == userNumber {
            mainLabel.text = "Bingo!"
        } else if comNumber < userNumber {
            mainLabel.text = "Down"
        } else {
            mainLabel.text = "Up"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 메인레이블 "선택하세요"
        mainLabel.text = "선택하세요"
        // 2) 컴퓨터의 랜덤숫자를 다시 선택하게
        comNumber = Int.random(in: 1...10)
        // 3) 숫자레이블 ""
        numberLabel.text = ""
    }
    
    
}
