//
//  RandomViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/14/25.
//

import UIKit
import SnapKit

protocol ViewConfiguration: AnyObject { // 클래스에만 사용하게
    func configureHierarchy() // addSubView
    func configureLayout() // snapKit
    func configureView() // property
}

class RandomViewController: UIViewController, ViewConfiguration {
    
    let dogImageView = UIImageView()
    let randomButton = UIButton()
    let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(dogImageView)
        view.addSubview(randomButton)
        view.addSubview(nameLabel)
        
    }
    
    func configureLayout() {
        dogImageView.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(dogImageView.snp.bottom).offset(20)
        }
        
        randomButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
    
    func configureView() {
        dogImageView.backgroundColor = .brown
        nameLabel.backgroundColor = .yellow
        randomButton.backgroundColor = .blue
    }

}
