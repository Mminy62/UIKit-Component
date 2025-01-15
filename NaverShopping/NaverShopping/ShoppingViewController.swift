//
//  ShoppingViewController.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import UIKit
import SnapKit
import Kingfisher

class ShoppingViewController: UIViewController, ViewConfiguration {
    let searchItem: String
    let totalLabel = UILabel()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        let widthSize = Double((Int(view.frame.width) - offsetSize * 2 - lineSpacing) / 2)
        layout.itemSize = CGSize(width: widthSize, height: widthSize * 1.5)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
    }
    
    func configureView() {
        navigationItem.title = searchItem
        
        // 여기서도 따로 해줘야하는건지?
        let navAppearance = UINavigationBarAppearance()
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = navAppearance
        
        totalLabel.text = "ddddd"
        totalLabel.textColor = .systemGreen
        totalLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        collectionView.backgroundColor = .black
    }
}

extension ShoppingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCollectionViewCell.id, for: indexPath) as! ShoppingCollectionViewCell
        
        cell.backgroundColor = .brown
        cell.configureData(item: Data(image: "", mallName: "미나리캠핑카", title: "캠핑카카카카", lprice: "100000"))
        return cell
    }
    
    
}

struct Data {
    let image, mallName, title, lprice: String
}
