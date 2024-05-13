//
//  CompositionalLayoutSectionHelper.swift
//  AppStoreView
//
//  Created by 이민영 on 5/13/24.
//

import Foundation
import UIKit

class CompositionalLayoutSectionHelper {
    
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
}
