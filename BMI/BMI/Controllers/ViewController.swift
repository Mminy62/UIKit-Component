//
//  ViewController.swift
//  BMI
//
//  Created by 이민영 on 12/8/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
//    var userBMI: BMI = BMI()
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    private func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm 단위로 입력해주세요"
        weightTextField.placeholder = "kg 단위로 입력해주세요"
    }
    
    // 버튼을 누르면 -> tapped -> segue -> prepare 순으로 불림
    // secondViewController(받는 화면)에 받을 데이터 변수 선언 -> 
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard let height = heightTextField.text, let weight = weightTextField.text else { return }
        bmiManager.bmi = bmiManager.calculateBMI(height: height, weight: weight)
//        userBMI.bmi = calculateBMI(height: height, weight: weight)
//        userBMI.adviceString = getBMIAdviceString()
//        userBMI.adviceColor = getBackgroundColor()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = .black
        return true
    }
    
    // 버튼을 눌렀을 때, 조건 없이 바로 화면이 넘어가서 데이터 전달이면 => prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmi = bmiManager.getBMIResult()
            secondVC.adviceColor = bmiManager.getBackgroundColor()
            secondVC.adviceString = bmiManager.getBMIAdviceString()
        }
        // 다음 화면으로 넘어간 후엔 textfield 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }

}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true
        }
        return false
        
    }
    
    // return 키를 눌렀을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            textField.resignFirstResponder()
            return true
        // 두번째 텍스트필드로 넘어갈 때
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder() // 여기로 가기
            return true
        }
        return false
    }
    
    // MARK: 화면 터치시, 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 화면 터치 시, 두개의 textfield에 해당하는 키보드 내리겠다
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}


