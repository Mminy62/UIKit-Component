//
//  CodeCollectionViewCell.swift
//  FourthWeek
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit

class CodeCollectionViewCell: UICollectionViewCell {
    static let identifier = "CodeCollectionViewCell"
    let bookCoverImageView = UIImageView()
    
    // viewDidLoad, awakeFromNib 과 비슷함
    override init(frame: CGRect) {
        super.init(frame: frame) // override라 super.init 호출
        // 셀에는 contentView가 존재! view가 아니라 contentView에 뷰를 추가해야 액션이 동작한다.
        // cell에 추가해줘도 에러를 안잡아줌, 올바른 위치는 contentView임
        contentView.addSubview(bookCoverImageView)
        
        bookCoverImageView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        bookCoverImageView.backgroundColor = .brown
    }
    // 내일 공부할 것!!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
