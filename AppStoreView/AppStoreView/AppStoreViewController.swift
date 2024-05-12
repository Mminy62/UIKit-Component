//
//  AppStoreViewController.swift
//  AppStoreView
//
//  Created by 이민영 on 5/13/24.
//

import UIKit

class AppStoreViewController: UIViewController {
    
    // uiview controller 안에 collection view 넣기 
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout() // CollectionView layout object
        layout.itemSize = .init(width: 350, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

