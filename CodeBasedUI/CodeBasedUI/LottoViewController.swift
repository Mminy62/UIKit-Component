//
//  LottoViewController.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire

protocol ViewConfiguration {
    func configureHierarchy() // addSubView
    func configureLayout() // SnapKit
    func configureView() // property
}

struct Lotto {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}


class LottoViewController: UIViewController, ViewConfiguration {
    let roundTextField = UITextField()
    let infoLabel = UILabel()
    let dateLabel = UILabel()
    let lineView = UIView()
    let roundLabel = UILabel()
    let titleLabel = UILabel()
    var numberLabels = (0..<8).map { _ in UILabel() }
    var plusLabel = UILabel()
    let stackView = UIStackView()
    let pickerView = UIPickerView()
    let recentRound = 1154
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        roundTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(roundTextField)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(lineView)
        view.addSubview(roundLabel)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        
        // stackview - +까지 공 8개
        for i in 0...numberLabels.count - 1 {
            stackView.addArrangedSubview(numberLabels[i])
        }
    }
    
    func configureLayout() {
        roundTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(roundTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(30)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(roundTextField.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(1)
        }
        
        roundLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top)
            make.leading.equalTo(infoLabel.snp.trailing).offset(30)
            make.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(30)
            make.leading.equalTo(roundLabel.snp.trailing).offset(10)
            make.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        for i in 0...numberLabels.count - 1 { // size configure는 공 모두에 넣음
            numberLabels[i].snp.makeConstraints { make in
                make.width.height.equalTo(40)
            }
        }
    }
    
    func configureView() {
        roundTextField.textColor = .black
        roundTextField.borderStyle = .roundedRect
        roundTextField.font = UIFont.systemFont(ofSize: 18)
        roundTextField.textAlignment = .center
        
        infoLabel.textColor = .black
        infoLabel.text = "당첨번호 안내"
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        
        dateLabel.textColor = .gray
        dateLabel.text = "2020-05-30 추첨" // data
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        
        lineView.backgroundColor = .lightGray
        
        titleLabel.text = "당첨결과"
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        
        roundLabel.text = "913회" // data
        roundLabel.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        roundLabel.textColor = .systemYellow
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        for i in 0..<numberLabels.count {
            if i == 6 {
                configurePlusStyle(numberLabels[i])
            } else {
                configureBallStyle(numberLabels[i])
            }
        }
        
        // pickerView
        pickerView.selectRow(recentRound - 1, inComponent: 0, animated: true)
    }
    
    func configurePlusStyle(_ label: UILabel) {
        label.backgroundColor = .white
        label.text = "+"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
    }
    
    func configureBallStyle(_ label: UILabel) {
        label.backgroundColor = .blue
        label.text = "23"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
    }
    
    func getLottoData() {
        // 반복문으로 넣어주면돼
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1154"
        AF.request(url, method: .get).responseString { response in
            print(response)
        }
    }
}

extension LottoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        roundTextField.inputView = pickerView
    }
}


extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        recentRound
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(row + 1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roundTextField.text = String(row + 1)
        // 서버통신
    }
    
}
