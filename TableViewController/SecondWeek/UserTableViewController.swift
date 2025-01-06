//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // xib cell 을 등록하는 과정
        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
    }
    
    // MARK: TableView Data
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! UserTableViewCell
//         let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! UserTableViewCell // 이렇게 하면 터짐
        
        
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = friends[indexPath.row]
        
        // cell view에서 일어나는 것을 제어하는 역할이 viewController이므로, indexPath, action의 경우는 viewController에 두는 편임

        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell // index 번호까지 붙여서 확인
//        let tempCell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        
        
        cell.configureData(row: friend) // 코드 분리이지, 역할을 나눠 VC의 부담을 덜어준 것은 아님. 조금이라도 private으로 안에 like button만 나오게 하면 좀 나음
        cell.likeButton.setImage(UIImage(systemName: friend.like ? "heart.fill" : "heart"), for: .normal)
        cell.likeButton.tag = indexPath.row // button tag 값 부여
        // selector(함수 이름) 만으로 호출되는 이유 - Fuction Types: 클로저, 일급객체
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        friends[sender.tag].like.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
}
