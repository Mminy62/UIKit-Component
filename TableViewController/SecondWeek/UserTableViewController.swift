//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/3/25.
//

import UIKit

struct Friend {
    let name: String
    let message: String
    let profile_image : String
}

class UserTableViewController: UITableViewController {
    
    let friends: [Friend] = [
        Friend(name: "고래밥", message: "냠냠", profile_image: "star"),
        Friend(name: "칙촉", message: "행복한 하루", profile_image: "person"),
        Friend(name: "카스타드", message: "배고파", profile_image: "pencil"),
    ]
    
    let name = ["고래밥", "칙촉", "카스타드"]
    let message = ["고래밥 냠냠", "행복한 하루", "배고파"]
    let profileImageName = ["star", "person", "pencil"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! UserTableViewCell // index 번호까지 붙여서 확인
        cell.profileImageView.backgroundColor = .brown
        cell.nameLabel.text = friends[indexPath.row].name
        cell.messageLabel.text = friends[indexPath.row].message
        cell.profileImageView.image = UIImage(systemName: friends[indexPath.row].profile_image)
        
        cell.nameLabel.font = .boldSystemFont(ofSize: 14.0)
        cell.messageLabel.font = UIFont.systemFont(ofSize: 14.0)
        return cell
    }

}
