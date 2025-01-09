//
//  GameViewController.swift
//  ProtocolProject
//
//  Created by 이민영 on 1/9/25.
//

import UIKit

class GameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var resultView: UITextView!
    var maxNumber: Int = 100
    let numberPickerView = UIPickerView()
    
    static var temp = 24
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldView.inputView = numberPickerView
        numberPickerView.delegate = self
        numberPickerView.dataSource = self
        configureUI()
    }
    
    func configureUI() {
        titleLabel.text = "369 게임"
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
        
        textFieldView.placeholder = "최대 숫자를 입력해주세요"
        textFieldView.font = UIFont.systemFont(ofSize: 16)
        
        resultView.text = ""
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxNumber
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(maxNumber - row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var result: [String] = []
        
        for num in 1...(maxNumber - row) {
            let item = String(num)
            if item.contains("3") || item.contains("6") || item.contains("9") {
                result.append("👏")
            } else {
                result.append(item)
            }
        }
        
        resultView.text = result.joined(separator: ", ")
    }
    
}
