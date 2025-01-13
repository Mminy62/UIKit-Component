//
//  UserTableViewCell.swift
//  ChattingProject
//
//  Created by 이민영 on 1/11/25.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    static let identifier = "UserTableViewCell"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messsageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureUI(data: Chat) {
        timeLabel.text = data.date.convertToDateString(formatString: "hh:mm a")
        timeLabel.font = UIFont.systemFont(ofSize: 14.0)
        timeLabel.textColor = .gray
        
        messageLabel.text = data.message
        messageLabel.numberOfLines = 0
        messageLabel.font = UIFont.systemFont(ofSize: 15.0)
        messsageView.backgroundColor = .systemGray4
        messsageView.layer.cornerRadius = 10
    }

    
}

