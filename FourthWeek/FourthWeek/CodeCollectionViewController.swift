//
//  CodeCollectionViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class CodeCollectionViewController: UIViewController {
    
    var mainView = CodeView()
    // Custom View 를 가져올 수 있음, super X (apple의 이 메서드의 super는 애플 view이기 때문에, mainView가 제대로 로드 안될 수 있음)
    // loadView: VC의 self.view 인 메인 뷰에 로드할 때 호출하는 함수
    override func loadView() {
        print(#function)
        view = mainView
    }
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()

        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

extension CodeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CodeCollectionViewCell.identifier, for: indexPath) as! CodeCollectionViewCell
        
        cell.bookCoverImageView.layer.cornerRadius = 10
        return cell
    }
}
