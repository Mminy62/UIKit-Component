//
//  RankViewController.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class RankViewController: UIViewController {
    let dataList = mockData
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜를 입력하세요"
        textField.textColor = .white
        return textField
    }()
    let textFieldBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(searchTextField)
        view.addSubview(textFieldBarView)
        view.addSubview(searchButton)
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        collectionView.register(CodeCollectionViewCell.self, forCellWithReuseIdentifier: CodeCollectionViewCell.identifier)
        collectionView.register(RankCollectionViewCell.self, forCellWithReuseIdentifier: RankCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        
        createItemLayout()
        
    }
    
//    func createCollectionLayout() -> UICollectionViewFlowLayout {
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 50, height: 50)
//        layout.scrollDirection = .vertical
//        return layout
//    }
    
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 40, height: 50)
        layout.scrollDirection = .vertical
        return layout

    }
    
    func createItemLayout(){
        searchTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(50)
        }
        
        textFieldBarView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(2)
        }
        
        searchButton.snp.makeConstraints { make in
            make.bottom.equalTo(textFieldBarView.snp.bottom)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(textFieldBarView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview() // 추가
        }
    }

}

extension RankViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankCollectionViewCell.identifier, for: indexPath) as! RankCollectionViewCell
        cell.configureData(row: dataList[indexPath.item])
        return cell
    }
}
