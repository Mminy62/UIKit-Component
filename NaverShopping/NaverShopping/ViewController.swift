//
//  ViewController.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import UIKit
import SnapKit

class ViewController: BaseViewController, UISearchBarDelegate {
    let searchBar = UISearchBar()
    let mainImageView = UIImageView()
    let subtitleLabel = UILabel()
    lazy var alert = UIAlertController().createAlert() {
        print("alert 통신 끝")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(mainImageView)
        view.addSubview(subtitleLabel)
    }
    
    override func configureLayout() {
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
    }
    
    override func configureView() {
        self.navigationItem.title = "도봉러의 쇼핑쇼핑"
        navigationItem.standardAppearance = NavigationAppearance.shared.textAttribute

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
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let content = searchBar.text, content.count > 1 {
            view.endEditing(true)
            navigationController?.pushViewController(ShoppingViewController(searchItem: content), animated: true)
        } else {
            present(alert, animated: true)
            view.endEditing(false)
        }
    }
}


extension UIAlertController {
    func createAlert(completionHandler: @escaping () -> ()) -> UIViewController {
        let alert = UIAlertController(title: "두 글자 이상 작성해주세요", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .destructive))
        completionHandler()
        return alert
    }
}
