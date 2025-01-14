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
    var numberLabels = (0..<7).map { _ in UILabel() }
    var plusLabel = UILabel()
    let stackView = UIStackView()
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
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
        view.addSubview(pickerView)
        // stackview - 공 6개
        for i in 0...numberLabels.count - 2 {
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
        
        pickerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
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
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        numberLabels.forEach { label in
            configureBallStyle(label)
        }
        
        plusLabel.text = "+"
        plusLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
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
