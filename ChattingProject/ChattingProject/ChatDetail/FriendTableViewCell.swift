//
//  FriendTableViewCell.swift
//  ChattingProject
//
//  Created by 이민영 on 1/12/25.
//

import UIKit
import Kingfisher

class FriendTableViewCell: UITableViewCell {
    static let identifier = "FriendTableViewCell"
    
    @IBOutlet weak var chatBackgroundView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureUI(data: Chat) {
        profileImageView.image = UIImage(named: data.user.rawValue)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
        chatBackgroundView.image = UIImage(named: "chat_bubble_you_dark")
        chatBackgroundView.contentMode = .scaleToFill
        nameLabel.text = data.user.rawValue
        nameLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .semibold)
        messageLabel.text = data.message
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 15.0)
        
        timeLabel.text = data.date.convertToDateString(formatString: "hh:mm a")
        timeLabel.font = UIFont.systemFont(ofSize: 14.0)
        timeLabel.textColor = .gray
    }
}
