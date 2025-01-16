//
//  BaseCollectionView.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
//    let itemImageView = UIImageView()
//    let mallLabel = UILabel()
//    let titleLabel = UILabel()
//    let lprice = UILabel()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() { }
    
    func configureLayout() { }
    
    func configureView() { }
    
}
