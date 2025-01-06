//
//  UserTableViewCell.swift
//  SecondWeek
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {

    static let identifier = "UserTableViewCell"
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var messageLabel: UILabel!
    
    // UIKit - xib 파일, 스토리보드, 코드 베이스로 실행할 때 개별로 실행하는 함수가 많음
    // 코드베이스로 짜면 awakeFromNib 함수는 스토리보드가 아니라서 호출이 안됨
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        profileImageView.image = UIImage(systemName: "person")
        profileImageView.backgroundColor = .brown
        nameLabel.font = .boldSystemFont(ofSize: 14.0)
        messageLabel.font = UIFont.systemFont(ofSize: 14.0)
        messageLabel.numberOfLines = 0
    }
    
    // VC.cellforRowAt에서 사용되는데, 매번 호출되는 중임 > 굳이?
    // 절대 안바뀔 세팅은 awakeFromNib에서 사용해도 됨
    func configureData(row: Friends) {
        nameLabel.text = row.nameDescription
        messageLabel.text = row.message
        
        if let imageName = row.profile_image {
            profileImageView.kf.setImage (
                with: URL(string: imageName),
                placeholder: UIImage(systemName: "star")
            )
        }
    }
    
    // cell 캐싱처럼 로드 될때마다 reuse 될때 사용하는 함수
    // 처음 생성 이후, reuse 될때 일단 기본값으로 person 이미지를 띄워놓는 거
    override func prepareForReuse() {
        super.prepareForReuse()
//        print(#function)
        //
        profileImageView.image = UIImage(systemName: "person")
        // 결국 처음 생성
    }
    

}
