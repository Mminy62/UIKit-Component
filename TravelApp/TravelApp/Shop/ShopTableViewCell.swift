//
//  ShopTableViewCell.swift
//  TravelApp
//
//  Created by 이민영 on 1/6/25.
//

import UIKit

class ShopTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureData(row: Shop) {
        titleLabel.text = row.title
        let checkButtonImage = UIImage(systemName: row.purchase ? "checkmark.square.fill" : "checkmark.square")
        let likeButtonImage = UIImage(systemName: row.like ? "star.fill" : "star")
        checkButton.setImage(checkButtonImage, for: .normal)
        likeButton.setImage(likeButtonImage, for: .normal)
    }
    
    private func configureUI() {
        backView.backgroundColor = UIColor.systemGray6
        backView.layer.cornerRadius = 10
        titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
        checkButton.tintColor = .black
        likeButton.tintColor = .black
    }
}
