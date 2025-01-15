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

class ShoppingViewController: UIViewController, ViewConfiguration {
    let searchItem: String
    let totalLabel = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
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
    }
    
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalToSuperview().offset(10)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(totalLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        
        let layout = UICollectionViewFlowLayout()
        let offsetSize = 10
        let lineSpacing = 20
        let viewWidth = UIScreen.main.bounds.width
        let widthSize = Double((Int(viewWidth) - offsetSize * 2 - lineSpacing) / 2)
        print("cell:", widthSize)
        layout.itemSize = CGSize(width: widthSize, height: widthSize * 1.5)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    func configureView() {
        navigationItem.title = searchItem
        let navAppearance = UINavigationBarAppearance()
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = navAppearance
        
        totalLabel.text = "ddddd"
        totalLabel.textColor = .systemGreen
        totalLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        collectionView.backgroundColor = .black
    }
    
    func callRequest() {
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(searchItem)"
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
