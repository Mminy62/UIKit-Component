//
//  SampleCollectionViewCell.swift
//  ThirdWeek
//
//  Created by 이민영 on 1/9/25.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    static let identifier: String = "SampleCollectionViewCell"
    var index: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        print(#function)
    }
    
    // 하위뷰의 업데이트가 필요할 때 실행됨
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        posterImageView.layer.cornerRadius = posterImageView.frame.width / 2
//        print("\(index): \(posterImageView.frame.width / 2)")
//    }
//    override func layoutIfNeeded() {
//        super.layoutIfNeeded()
//        posterImageView.layer.cornerRadius = posterImageView.frame.width / 2
//        print("\(index): \(posterImageView.frame.width / 2)")
//    }
    // layoutSubviews과 예전에 많이 비교했음
    //    override func layoutIfNeeded() {
    //        <#code#>
    //    }


}


