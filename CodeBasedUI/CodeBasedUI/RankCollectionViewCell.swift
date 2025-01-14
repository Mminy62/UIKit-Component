//
//  RankCollectionViewCell.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/14/25.
//

import UIKit
import SnapKit

class RankCollectionViewCell: UICollectionViewCell {
    static let identifier = "RankCollectionViewCell"
    let rankLabel = UILabel()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(rankLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
        configureUI()
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(row: Data) {
        print(#function)
        rankLabel.text = "\(row.rank)"
        titleLabel.text = row.title
        dateLabel.text = row.date
    }
    
    private func configureUI() {
        rankLabel.textColor = .black
        rankLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        rankLabel.backgroundColor = .white
        rankLabel.textAlignment = .center
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        dateLabel.textColor = .white
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    private func configureLayout() {
        rankLabel.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(20)
            make.width.equalTo(40)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(20)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-80)
            make.top.equalTo(safeAreaLayoutGuide)
        }
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(safeAreaLayoutGuide)
        }
    }
}
