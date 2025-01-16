//
//  CodeView.swift
//  FourthWeek
//
//  Created by 이민영 on 1/16/25.
//

import UIKit
import SnapKit

class CodeView: BaseView {
    lazy var collectionView = createCollectionView()
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
        collectionView.register(CodeCollectionViewCell.self, forCellWithReuseIdentifier: CodeCollectionViewCell.identifier)
        return collectionView
    }
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        return layout
    }
    
    override func configureHierarchy() {
        // 현재 self가 view 이기에 생략해도 됨
        addSubview(collectionView)
    }
    
    override func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        backgroundColor = .white
        collectionView.register(CodeCollectionViewCell.self, forCellWithReuseIdentifier: CodeCollectionViewCell.identifier)
    }
    
}

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 화면 전환은 present, push는 viewcontroller에서 가능 => 그래서 어차피 나와야하기 때문에
        // 화면 이동은 VC -> VC 로 이동하는 것이기 때문에 ViewController에서 해야하지, UIView -> VC로 이동하지 않는다.
        // delegate, datasource, interaction 하는 로직은 VC에서 하도록 돌리자.
        
//        let vc = CodeCollectionViewController()
//        present(vc, animated: true) // UIViewController가 아니어서 못함
//    }
