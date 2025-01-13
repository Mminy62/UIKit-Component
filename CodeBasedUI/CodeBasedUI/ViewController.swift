//
//  ViewController.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let jackFlixButton = UIButton()
    let nPayButton = UIButton()
    let rankButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(jackFlixButton)
        view.addSubview(nPayButton)
        view.addSubview(rankButton)
        
        jackFlixButton.translatesAutoresizingMaskIntoConstraints = false
        nPayButton.translatesAutoresizingMaskIntoConstraints = false
        rankButton.translatesAutoresizingMaskIntoConstraints = false
        
        configureUI()
        configureLayout()
    }
    
    func configureUI() {
        jackFlixButton.setTitle(MenuButton.jack.title, for: .normal)
        nPayButton.setTitle(MenuButton.npay.title, for: .normal)
        rankButton.setTitle(MenuButton.rank.title, for: .normal)
        jackFlixButton.backgroundColor = .systemBlue
        nPayButton.backgroundColor = .systemBlue
        rankButton.backgroundColor = .systemBlue
        
        // Q: 아예 파라미터에 enum 타입을 넣을 순 없는지??
        jackFlixButton.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        nPayButton.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        rankButton.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        
    }

    func configureLayout() {
        jackFlixButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        nPayButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(jackFlixButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        rankButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nPayButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let type = MenuButton.allCases.filter { $0.title == sender.currentTitle }.last!
        present(type.vc, animated: true)
    }
    
}

// objc 함수의 파라미터로 enum을 쓰려면, enum에도 @objc와 타입이 붙어야한다... 왜?
@objc enum MenuButton: Int, CaseIterable {
    case jack
    case npay
    case rank
    
    var title: String {
        switch self {
        case .jack:
            "JackFlix"
        case .npay:
            "NPay"
        case .rank:
            "Rank"
        }
    }
    
    var vc: UIViewController {
        switch self {
        case .jack:
            return JackViewController()
        case .npay:
            return NpayViewController()
        case .rank:
            return RankViewController()
        }
    }
    
}
