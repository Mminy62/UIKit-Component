//
//  ChatListCollectionViewCell.swift
//  ChattingProject
//
//  Created by 이민영 on 1/11/25.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ChatListCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureData(item: ChatRoom) {
        profileImageView.image = UIImage(named: item.chatroomImage[0])
        nameLabel.text = item.chatroomName
        messageLabel.text = item.chatList.last?.message
        dateLabel.text = item.chatList.last?.date.convertToDateString(formatString: "yy.MM.dd")
    }
    
    private func configureUI() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.contentMode = .scaleAspectFill
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .gray
        dateLabel.textColor = .gray
        dateLabel.font = UIFont.systemFont(ofSize: 14)
    }
    

}
