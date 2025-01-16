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

//struct SearchInfo {
//    let searchItem: String
//    let shopData: [Item]
//    let sort: String
//}

class ShoppingViewController: BaseViewController, ViewConfiguration {
    let totalLabel = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let buttonStackView = UIStackView()
    let buttons = (0..<4).map {_ in SortButtonView()}
    
    let searchItem: String
    var shopData: [Item] = []
    var sortType: SortType = SortType.sim
    var isEnd: Bool = false
    var startPos: Int = 1
    
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
        collectionView.prefetchDataSource = self

        callRequest()
    }
    
    override func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(collectionView)
        view.addSubview(buttonStackView)
        for i in 0..<buttons.count {
            buttonStackView.addArrangedSubview(buttons[i])
        }
    }
    
    override func configureLayout() {
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
        
        let layout = UICollectionViewFlowLayout()
        let offsetSize = 10
        let lineSpacing = 20
        let viewWidth = UIScreen.main.bounds.width
        let widthSize = Double((Int(viewWidth) - offsetSize * 2 - lineSpacing) / 2)
        layout.itemSize = CGSize(width: widthSize, height: widthSize * 1.7)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    override func configureView() {
        navigationItem.title = searchItem
        navigationItem.standardAppearance = NavigationAppearance.shared.textAttribute
        
        totalLabel.textColor = .systemGreen
        totalLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        collectionView.backgroundColor = .black
        
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillProportionally
        buttonStackView.spacing = 10
        let buttonTypes = SortType.allCases
        
        for i in 0..<buttons.count {
            buttons[i].setTitle(" \(buttonTypes[i].title) ", for: .normal)
            buttons[i].addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons[i].tag = i
        }
    
    }
    
    func callRequest() {
        print(shopData.count, startPos, sortType.rawValue)
        var url = "https://openapi.naver.com/v1/search/shop.json?query=\(searchItem)&display=30&start=\(startPos)&sort=\(sortType.rawValue)"
        let header: HTTPHeaders = APIkey.Naver.value
        
        AF.request(url, method: .get, headers: header)
            .validate()
            .responseDecodable(of: Shop.self) { response in
                switch response.result {
                    
                case .success(let value):
                    if value.total == 0 { // data가 없을 때
                        self.shopData.removeAll()
                        print("검색 결과가 없습니다")
                        self.collectionView.reloadData()
                    } else {
                        self.shopData.append(contentsOf: value.items)
                        self.collectionView.reloadData()
                        if self.startPos == 1 {
                            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
                        }
                    }
                    
                    // isEnd 설정
                    if value.items.count < 30 {
                        self.isEnd = true
                    }
                    
                    self.totalLabel.text = "\(value.total.convertToDecimalString()) 개의 검색 결과"
                    
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
                
                let type = SortType.allCases[sender.tag]
                if sortType != type { // 다른 버튼을 눌렀을 때, shopData 지우기
                    sortType = type
                    startPos = 1
                    isEnd = false
                    shopData.removeAll()
                }
            }
            else {
                button.isSelected = false
                button.backgroundColor = .black
            }
        }
        callRequest()
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

extension ShoppingViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for item in indexPaths {
            if !shopData.isEmpty && shopData.count - 2 == item.row && !isEnd {
                startPos = shopData.count + 1
                callRequest()
            }
        }
        
    }
    
    
}
