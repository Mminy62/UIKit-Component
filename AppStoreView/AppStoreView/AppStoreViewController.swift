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
        
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            
            switch sectionIndex {
                
            case 0: return CompositionalLayoutSectionHelper.createFeaturedAppsSection()
                
            case 1: return nil
            
            default: return nil
            }
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App Store"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        setupCollectionView()
        
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        // 화면 꽉 차게 세팅
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.register(FeaturedAppsCell.self, forCellWithReuseIdentifier: FeaturedAppsCell.identifier)
        
    }

}

extension AppStoreViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        featuredApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexPath: 셀의 위치를 특정
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedAppsCell.identifier, for: indexPath) as! FeaturedAppsCell
        cell.featuredApppItem = featuredApps[indexPath.row]
        
        return cell
    }
}
