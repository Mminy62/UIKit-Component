//
//  TravelTableViewCell.swift
//  TravelApp
//
//  Created by 이민영 on 1/3/25.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    func configureUI() {
        likeButton.tintColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        titleLabel.textColor = .black
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 2
        
        saveLabel.textColor = .systemGray2
        saveLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    }
}
