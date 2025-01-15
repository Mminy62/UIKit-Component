//
//  ShoppingCollectionViewCell.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import UIKit
import SnapKit
import Kingfisher

class ShoppingCollectionViewCell: UICollectionViewCell, ViewConfiguration {
    static let id = "ShoppingCollectionViewCell"
    
    let itemImageView = UIImageView()
    let mallLabel = UILabel()
    let titleLabel = UILabel()
    let lprice = UILabel()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(item: Item) {
        itemImageView.kf.setImage(with: URL(string:item.image))
        mallLabel.text = item.mallName
        titleLabel.text = item.title
        lprice.text = item.lprice
    }
    
    func configureHierarchy() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(stackView)
        [mallLabel, titleLabel, lprice].map {
            self.stackView.addArrangedSubview($0)
        }
    }
    
    func configureLayout() {
        itemImageView.snp.makeConstraints { make in
            make.width.height.equalTo(self.frame.width)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(itemImageView.snp.bottom).offset(5)
            make.horizontalEdges.equalTo(itemImageView.snp.horizontalEdges)
        }
    }
    
    func configureView() {
        itemImageView.layer.cornerRadius = 10
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.clipsToBounds = true // 왕중요...
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        
        mallLabel.textColor = .gray
        mallLabel.font = UIFont.systemFont(ofSize: 14)
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.numberOfLines = 2
        
        lprice.textColor = .white
        lprice.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
}
