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
                
            case 1: return CompositionalLayoutSectionHelper.createTopFreeAppsSection()
            
            default: return nil
            }
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    // CollectionView의 constraint 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App Store"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupCollectionView()
    }
    
    // constraint 설정
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
        // collectionView에 등록
        // 각 셀들에 대한 constraint기록된 정보들
        collectionView.register(FeaturedAppsCell.self, forCellWithReuseIdentifier: FeaturedAppsCell.identifier)
        collectionView.register(FreeAppCell.self, forCellWithReuseIdentifier: FreeAppCell.identifier)
        collectionView.register(HeaderSupplementaryCell.self, forSupplementaryViewOfKind: HeaderSupplementaryCell.kind, withReuseIdentifier: HeaderSupplementaryCell.identifier)
    }

}

extension AppStoreViewController: UICollectionViewDataSource {
    
    // section 2개이므로 변경
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if section == 0 {
            return featuredApps.count
        } else {
            return topFreeApps.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // indexPath: 셀의 위치를 특정

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedAppsCell.identifier, for: indexPath) as! FeaturedAppsCell
            cell.featuredApppItem = featuredApps[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FreeAppCell.identifier, for: indexPath) as! FreeAppCell
            cell.item = topFreeApps[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: HeaderSupplementaryCell.kind, withReuseIdentifier: HeaderSupplementaryCell.identifier, for: indexPath) as! HeaderSupplementaryCell
        
        supplementaryView.label.text = "Top Free Apps"
        
        return supplementaryView
    }
}
