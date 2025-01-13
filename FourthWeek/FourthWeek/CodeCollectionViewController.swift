//
//  CodeCollectionViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class CodeCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
//    let collectionView = UICollectionView()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        // delegate, datasource 선언
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        // cell register 해줘야함
        // 코드 베이스이기 때문에 UINib이 아닌 CollectionViewCell 클래스 자체를 넣어줘야한다.
        //
        collectionView.register(CodeCollectionViewCell.self, forCellWithReuseIdentifier: CodeCollectionViewCell.identifier)
        
        // collectionView layout 안짜나?
    }
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        return layout
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CodeCollectionViewCell.identifier, for: indexPath) as! CodeCollectionViewCell
        
        cell.bookCoverImageView.layer.cornerRadius = 10
        return cell
    }
    
}
