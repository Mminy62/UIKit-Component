//
//  AdTableViewCell.swift
//  TravelApp
//
//  Created by 이민영 on 1/4/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var adBackgroundView: UIView!
    
    func configureUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        
        adLabel.text = " AD "
        adLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        
        adBackgroundView.backgroundColor = .white
        adBackgroundView.layer.cornerRadius = 5
        
        backView.backgroundColor = UIColor.systemPink
        backView.layer.cornerRadius = 10
    }
}
