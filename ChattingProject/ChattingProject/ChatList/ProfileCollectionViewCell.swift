//
//  ProfileCollectionViewCell.swift
//  ChattingProject
//
//  Created by 이민영 on 1/13/25.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 10
    }
    
    func configureUI(imageName: String, cornerFlag: Bool) {
        profileImageView.image = UIImage(named: imageName)
        if cornerFlag {
            profileImageView.layer.cornerRadius = self.frame.height / 2
        }
    }
}
