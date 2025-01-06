//
//  TravelTableViewCell.swift
//  TravelApp
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureData(row: Travel){
        if let url = row.travel_image {
            posterImageView.kf.setImage(with: URL(string: url))
        }
        likeButton.setImage(UIImage(systemName: row.like! ? "heart.fill" : "heart"), for: .normal)
        titleLabel.text = row.title
        subtitleLabel.text = row.description
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        saveLabel.text = "저장 \(numberFormatter.string(for: row.save)!)"
    }
    
    private func configureUI() {
        likeButton.tintColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        titleLabel.textColor = .black
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 2
        
        saveLabel.textColor = .systemGray2
        saveLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        
        posterImageView.layer.cornerRadius = 10
        posterImageView.contentMode = .scaleAspectFill
    }
    
}
