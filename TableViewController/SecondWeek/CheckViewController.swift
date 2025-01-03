//
//  CheckViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 12/30/24.
//

import UIKit
import Kingfisher

class CheckViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackground() // extension 사용
        resultLabel.text = ""
        getToday()
        if let url = URL(string: "https://dimg.donga.com/wps/NEWS/IMAGE/2024/11/15/130433007.1.jpg") {
            photoImageView.kf.setImage(with: url)
        }
        photoImageView.image = UIImage(systemName: "star")
    }
    
    @discardableResult
    func getToday() -> String {
        let format = DateFormatter()
        format.dateFormat = "yy년 MM월 dd일"
        
        let today = format.string(from: Date())
        dateLabel.text = today
        return today
    }
    
    func randomInt() -> Int {
        Int.random(in: 1...100)
    }
    
    @IBAction func textFieldTextChanged(_ sender: UITextField) {
        //        if numberTextField.text?.trimmingCharacters(in: .whitespaces).count == 0 {
        //            return
        //        }
        
        if let text = numberTextField.text {
            if text.allSatisfy({ $0.isNumber }) {
                resultLabel.text = text
            } else {
                resultLabel.text = "숫자가 아닙니다."
                resultLabel.setPrimaryLabel()
            }
        }
        
        // 참고 답안
//        guard let jack = numberTextField.text else {
//            print("optional error")
//            return
//        }
//        
//        if Int(jack) != nil {
//            print(Int(jack)!)
//        }
    }
    
    
    // UserDefaults = key-value 형태로 저장되어 있음
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        sender.setTitle("저장하기", for: .normal)
        
        UserDefaults.standard.set(numberTextField.text, forKey: "number")
        print(#function)
        
        // UserDefaults 저장된 데이터 가져오기
        let num = UserDefaults.standard.string(forKey: "number")
        
        // MARK: - Alert
        // 저장이 성공적으로 되었다는 알림을 주기
        // Alert
        // 1. 타이틀 + 메세지
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet) // preferredStyle - alert: 화면 중간에 뜨는 것
        
        // 2. 버튼
        let ok = UIAlertAction(title: "확인", style: .default)
        let test1 = UIAlertAction(title: "테스트1", style: .cancel)
        let test2 = UIAlertAction(title: "테스트2", style: .default)
        let test3 = UIAlertAction(title: "테스트3", style: .default)
        
        // 3. 본문에 버튼 추가 // 추가된 순서대로 진행됨
        alert.addAction(test3)
        alert.addAction(ok)
        alert.addAction(test1)
        
        // 4. 화면에 띄우기
        present(alert, animated: true)
    }
}
