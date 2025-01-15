//
//  ShoppingViewController.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

enum ShopButton: String, CaseIterable {
    case sim
    case date
    case dsc
    case asc
    
    var title: String {
        switch self {
        case .sim:
            "정확도"
        case .date:
            "날짜순"
        case .dsc:
            "가격높은순"
        case .asc:
            "가격낮은순"
        }
    }
}


class ShoppingViewController: UIViewController, ViewConfiguration {
    let searchItem: String
    let totalLabel = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let buttonStackView = UIStackView()
    let buttons = (0..<4).map {_ in UIButton()}
    var shopData: [Item] = []
    
    init(searchItem: String) {
        self.searchItem = searchItem
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: ShoppingCollectionViewCell.id)
        
        configureHierarchy()
        configureLayout()
        configureView()
        callRequest()
        print(ShopButton.allCases)
    }
    
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(collectionView)
        view.addSubview(buttonStackView)
        for i in 0..<buttons.count {
            buttonStackView.addArrangedSubview(buttons[i])
        }
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(10)
        }
        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(40)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(buttonStackView.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        for i in 0..<buttons.count {
            buttons[i].snp.makeConstraints { make in
                make.height.equalTo(40)
            }
        }
        
        let layout = UICollectionViewFlowLayout()
        let offsetSize = 10
        let lineSpacing = 20
        let viewWidth = UIScreen.main.bounds.width
        let widthSize = Double((Int(viewWidth) - offsetSize * 2 - lineSpacing) / 2)
        layout.itemSize = CGSize(width: widthSize, height: widthSize * 1.7)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    func configureView() {
        navigationItem.title = searchItem
        let navAppearance = UINavigationBarAppearance()
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = navAppearance
        
        totalLabel.textColor = .systemGreen
        totalLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        collectionView.backgroundColor = .black
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillProportionally
        buttonStackView.spacing = 10
        let buttonTypes = ShopButton.allCases
        for i in 0..<buttons.count {
            configureSortButton(buttons[i], title: buttonTypes[i].title)
            buttons[i].addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons[i].tag = i
        }
    }
    
    private func configureSortButton(_ button: UIButton, title: String) {
        button.setTitle(" \(title) ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.backgroundColor = .black
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
    }
    
    func callRequest(sortString: String? = nil) {
        
        var url = "https://openapi.naver.com/v1/search/shop.json?query=\(searchItem)&display=100"
        if let sortString {
            url += "&sort=\(sortString)"
        }
        let header: HTTPHeaders = APIkey.Naver.value
        
        AF.request(url, method: .get, headers: header)
            .validate()
            .responseDecodable(of: Shop.self) { response in
                switch response.result {
                    
                case .success(let value):
                    self.totalLabel.text = "\(value.total) 개의 검색 결과"
                    self.shopData = value.items
                    self.collectionView.reloadData()
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        for button in buttons {
            if button == sender {
                button.isSelected = true
                button.backgroundColor = .white
                let type = ShopButton.allCases[sender.tag]
                print(type.rawValue)
                callRequest(sortString: type.rawValue)
            }
            else {
                button.isSelected = false
                button.backgroundColor = .black
            }
        }
    }
}

extension ShoppingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shopData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCollectionViewCell.id, for: indexPath) as! ShoppingCollectionViewCell
        cell.configureData(item: shopData[indexPath.item])
        return cell
    }
}
