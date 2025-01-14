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
    let lottoButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(jackFlixButton)
        view.addSubview(nPayButton)
        view.addSubview(rankButton)
        view.addSubview(lottoButton)
        
        configureUI()
        configureLayout()
    }
    
    func configureUI() {
        jackFlixButton.setTitle(PageButton.jack.title, for: .normal)
        nPayButton.setTitle(PageButton.npay.title, for: .normal)
        rankButton.setTitle(PageButton.rank.title, for: .normal)
        lottoButton.setTitle(PageButton.lotto.title, for: .normal)
        jackFlixButton.backgroundColor = .systemBlue
        nPayButton.backgroundColor = .systemBlue
        rankButton.backgroundColor = .systemBlue
        lottoButton.backgroundColor = .systemBlue
        
        // Q: 아예 파라미터에 enum 타입을 넣을 순 없는지??
        jackFlixButton.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        nPayButton.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        rankButton.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        lottoButton.addTarget(self, action: #selector(buttonTapped(_ :)), for: .touchUpInside)
        
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
        
        lottoButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rankButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let type = PageButton.allCases.filter { $0.title == sender.currentTitle }.last!
        present(type.vc, animated: true)
    }
    
}
