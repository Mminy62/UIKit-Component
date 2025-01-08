//
//  CityCollectionViewCell.swift
//  TravelApp
//
//  Created by 이민영 on 1/7/25.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = posterImageView.frame.width / 2
        posterImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
    
    func configureData(row: City) {
        let url = URL(string: row.city_image)
        posterImageView.kf.setImage(with: url)
        titleLabel.text = "\(row.city_name) | \(row.city_english_name)"
        descriptionLabel.text = row.city_explain
    }

}
