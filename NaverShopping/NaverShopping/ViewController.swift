//
//  ViewController.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController, ViewConfiguration, UISearchBarDelegate {
    let searchBar = UISearchBar()
    let mainImageView = UIImageView()
    let subtitleLabel = UILabel()
    let infoLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        searchBar.delegate = self
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(mainImageView)
        view.addSubview(subtitleLabel)
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
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.leading.equalTo(searchBar.snp.leading).offset(30)
            make.height.equalTo(20)
        }
    }
    
    func configureView() {
        self.navigationItem.title = "도봉러의 쇼핑쇼핑"
        let navAppearance = UINavigationBarAppearance()
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = navAppearance

        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .white  // 색상 변경
        navigationItem.backBarButtonItem = backBarButtonItem
        
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray2])
        searchBar.searchBarStyle = .minimal
        mainImageView.image = UIImage(named: "shopping")
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        subtitleLabel.text = "쇼핑하구팡"
        
        infoLabel.text = "2글자 이상 작성해주세요"
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        infoLabel.isHidden = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let content = searchBar.text, content.count > 1 {
            infoLabel.isHidden = true
            view.endEditing(true)
            navigationController?.pushViewController(ShoppingViewController(searchItem: content), animated: true)
        } else {
            infoLabel.isHidden = false
            view.endEditing(false)
        }
    }
        
}

