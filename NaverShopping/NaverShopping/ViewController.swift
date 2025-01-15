//
//  ViewController.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController, ViewConfiguration {
    let searchBar = UISearchBar()
    let mainImageView = UIImageView()
    let infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(mainImageView)
        view.addSubview(infoLabel)
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
    }
    
    func configureView() {
        self.navigationItem.title = "도봉러의 쇼핑쇼핑"
        let navAppearance = UINavigationBarAppearance()
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = navAppearance
        
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray2])
        searchBar.searchBarStyle = .minimal
        mainImageView.image = UIImage(named: "shopping")
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        infoLabel.text = "쇼핑하구팡"
    }
}

