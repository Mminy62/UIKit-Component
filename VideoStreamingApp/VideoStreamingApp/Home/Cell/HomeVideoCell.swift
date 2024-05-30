//
//  HomeVideoCell.swift
//  VideoStreamingApp
//
//  Created by 이민영 on 5/28/24.
//

import UIKit

class HomeVideoCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var channelTitleLabel: UILabel!
    @IBOutlet weak var channelSubtitleLabel: UILabel!
    
    @IBOutlet weak var hotImageView: UIImageView!
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // Initialization code
    // xib의 UI와 위의 코드가 linking 하는 지점
    // 그러므로 xib를 사용한 셀 같은 ui에 대한 접근은 awake nib에서 해야한다
    // awakeFromNib 앞인 init 함수에서 접근할 경우 UI - Nil 값을 가짐
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        self.containerView.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
