//
//  UIViewController+Extension.swift
//  ThirdWeek
//
//  Created by 이민영 on 1/9/25.
//

import UIKit

extension UIViewController {
    static func configureViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let screen = UIScreen.main.bounds  // main - deprecate // app delegate, scene delegate
        layout.itemSize = CGSize(width: 100, height: 100)
        // sectionInset - collection view의 margin 느낌
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 50, bottom: 0, right: 50)
        return layout
       
    }
}
