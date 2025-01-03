//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

struct Friend {
    let name: String
    let message: String
    let profile_image : String
}

class UserTableViewController: UITableViewController {
    
    let friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: TableView Data
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = friends[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! UserTableViewCell // index 번호까지 붙여서 확인
        cell.profileImageView.backgroundColor = .brown
        cell.nameLabel.text = friend.name
        cell.messageLabel.text = friend.message
        
        if let imageName = friend.profile_image {
            cell.profileImageView.kf.setImage (
                with: URL(string: imageName),
                placeholder: UIImage(systemName: "star")
            )
        } else {
            cell.profileImageView.image = UIImage(systemName: "person")
        }
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 14.0)
        cell.messageLabel.font = UIFont.systemFont(ofSize: 14.0)
        cell.likeButton.setImage(UIImage(systemName: friend.like ? "heart.fill" : "heart"), for: .normal)
        
        return cell
    }
    
}
