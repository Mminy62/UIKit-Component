//
//  TenCollectionViewCell.swift
//  SecondWeek
//
//  Created by 이민영 on 1/7/25.
//

import UIKit

class TenCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.backgroundColor = .brown
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
    }

}
