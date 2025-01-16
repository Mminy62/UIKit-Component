//
//  MarketTableViewCell.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit
import SnapKit

class MarketTableViewCell: BaseTableViewCell {
    
    static let id = "MarketTableViewCell"
    
//    let nameLabel = UILabel()
    let nameLabel = BlackRadiusLabel() // 매개변수 없이 호출해도, 알아서 init(frame:)이 호출되도록 설정됨

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        configureHierarchy()
//        configureLayout()
//        configureView()
//        
//    }
    
    override func configureHierarchy() {
        contentView.addSubview(nameLabel)
    }
    
    override func configureLayout() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide).inset(16)
        }
    }
    
    override func configureView() {
//        nameLabel.textColor = .brown
//        nameLabel.font = .boldSystemFont(ofSize: 20)
    }
}
