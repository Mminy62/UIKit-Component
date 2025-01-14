//
//  LottoViewController.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire

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
    let bonusLabel = UILabel()
    lazy var recentRound = 1154 + calculatedRecentDay()
    var lottoData: Lotto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        roundTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        
        getLottoData(round: recentRound)
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
        view.addSubview(bonusLabel)
        
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
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.trailing.equalTo(stackView.snp.trailing)
            make.height.equalTo(20)
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
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        
        lineView.backgroundColor = .lightGray
        
        titleLabel.text = "당첨결과"
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        
        roundLabel.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        roundLabel.textColor = .systemYellow
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        pickerView.selectRow(recentRound - 1, inComponent: 0, animated: true)
        
        bonusLabel.text = "보너스"
        bonusLabel.textColor = .darkGray
        bonusLabel.font = UIFont.systemFont(ofSize: 12)
        
        for i in 0..<numberLabels.count {
            if i == 6 {
                configurePlusStyle(numberLabels[i])
            } else {
                configureBallStyle(numberLabels[i])
            }
        }
    }
    
    private func configureLottoDataView() {
        if let lottoData {
            roundLabel.text = String(lottoData.drwNo)
            dateLabel.text = "\(lottoData.drwNoDate) 추첨"
            configureBallView(numberLabels[0], number: lottoData.drwtNo1)
            configureBallView(numberLabels[1], number: lottoData.drwtNo2)
            configureBallView(numberLabels[2], number: lottoData.drwtNo3)
            configureBallView(numberLabels[3], number: lottoData.drwtNo4)
            configureBallView(numberLabels[4], number: lottoData.drwtNo5)
            configureBallView(numberLabels[5], number: lottoData.drwtNo6)
            configureBallView(numberLabels[6], number: nil)
            configureBallView(numberLabels[7], number: lottoData.bnusNo)
        }
    }
    
    private func configureBallView(_ label: UILabel, number: Int?) {
        if let number {
            label.text = String(number)
            label.backgroundColor = createBallColor(number)
        } else {
            label.text = "+"
            label.backgroundColor = .white
        }
    }
    
    private func configurePlusStyle(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
    }
    
    private func configureBallStyle(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
    }
    
    private func createBallColor(_ number : Int) -> UIColor {
        switch number {
        case 1...10:
            return .systemYellow
        case 11...20:
            return .skyblue
        case 21...30:
            return .dahong
        case 31...40:
            return .systemGray2
        default:
            return .systemGreen
        }
    }
    
    private func getLottoData(round: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
                
            case .success(let value):
                self.lottoData = value
                self.configureLottoDataView()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func calculatedRecentDay() -> Int {
        let calendar = Calendar.current
        
        // 기준 날짜 설정 - 1154회(25.01.11) // 확실하게 일요일 기준 일주일로
        var standDayComponents = DateComponents()
        standDayComponents.day = 12
        standDayComponents.month = 1
        standDayComponents.year = 2025
        guard let standDay = calendar.date(from: standDayComponents) else {
            print("기준 날짜 생성 실패")
            return 0
        }
        
        let now = Date()
        
        // 두 날짜 간의 차이 계산
        let components = calendar.dateComponents([.day], from: standDay, to: now)
        guard let diffDays = components.day else { return 0 }
        return diffDays / 7
    }
}

// MARK: TextField View
extension LottoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        roundTextField.inputView = pickerView
    }
}

// MARK: Picker View
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
        getLottoData(round: row + 1)
    }
    
}
