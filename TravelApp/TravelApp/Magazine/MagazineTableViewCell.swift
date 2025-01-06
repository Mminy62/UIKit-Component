//
//  MagazineTableViewCell.swift
//  TravelApp
//
//  Created by 이민영 on 1/3/25.
//

import UIKit

class MagazineTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureData(row: Magazine) {
        posterImageView.kf.setImage(with: URL(string: row.photo_image))
        titleLabel.text = row.title
        subtitleLabel.text = row.subtitle
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyMMdd"
        let dateData = dateFormatter.date(from: row.date)
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        let newDateString = dateFormatter.string(from: dateData!)
        dateLabel.text = newDateString
    }
    
    private func configureUI() {
        posterImageView.layer.cornerRadius = 10
        posterImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        subtitleLabel.textColor = .gray
        subtitleLabel.textAlignment = .left
        
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.textColor = .gray
        dateLabel.textAlignment = .right
    }
}
