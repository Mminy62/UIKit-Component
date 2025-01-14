//
//  NpayViewController.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class NpayViewController: UIViewController {
    
    let segmentedControl: UISegmentedControl = {
        let item = UISegmentedControl(items: ["멤버십","현장결제","쿠폰"])
        item.selectedSegmentTintColor = .lightGray
        item.backgroundColor = .darkGray
        item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        item.layer.cornerRadius = 10
        return item
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
       return view
    }()
    
    let logoLabel: UILabel = {
        let view = UILabel()
        view.text = "NPay 국내"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        return view
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(segmentedControl)
        view.addSubview(backView)
        backView.addSubview(logoLabel)
        backView.addSubview(dismissButton)
        
        configureLayout()
    }

    private func configureLayout() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        backView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().offset(-view.frame.height/4)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).offset(10)
            make.leading.equalTo(backView.snp.leading).offset(20)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).offset(10)
            make.trailing.equalTo(backView.snp.trailing).offset(-20)
        }
        
        
    }
}
