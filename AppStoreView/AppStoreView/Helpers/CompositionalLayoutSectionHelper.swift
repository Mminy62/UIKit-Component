//
//  CompositionalLayoutSectionHelper.swift
//  AppStoreView
//
//  Created by 이민영 on 5/13/24.
//

import Foundation
import UIKit

class CompositionalLayoutSectionHelper {
    
    // First Section - Featured Apps
    static func createFeaturedAppsSection() -> NSCollectionLayoutSection? {
        // one item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // item을 포함하는 group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    // Second Section - Free Apps
    static func createTopFreeAppsSection() -> NSCollectionLayoutSection? {
        
        // cell이 양쪽으로 꽉 차있으므로 width - 100%, height: total 이 300인데 3개의 아이템이 보여야하니까 1/3
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1/3))
        let groupItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // item을 포함하는 group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [groupItem])
        group.contentInsets.top = 16.0
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
}
