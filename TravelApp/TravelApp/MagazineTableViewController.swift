//
//  MagazineTableViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    let magazineList = MagazineInfo().magazine

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SeSAC TRAVEL"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell") as! MagazineTableViewCell
        let magazineItem = magazineList[indexPath.row]
        
        
        cell.posterImageView.kf.setImage(with: URL(string: magazineItem.photo_image))
        cell.posterImageView.layer.cornerRadius = 10
        cell.posterImageView.contentMode = .scaleAspectFill
        
        cell.titleLabel.text = magazineItem.title
        cell.titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 2
        
        cell.subtitleLabel.text = magazineItem.subtitle
        cell.subtitleLabel.font = UIFont.systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .gray
        cell.subtitleLabel.textAlignment = .left
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyMMdd"
        let dateData = dateFormatter.date(from: magazineItem.date)
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        let newDateString = dateFormatter.string(from: dateData!)
        
        cell.dateLabel.text = newDateString
        cell.dateLabel.font = UIFont.systemFont(ofSize: 14)
        cell.dateLabel.textColor = .gray
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell") as! MagazineTableViewCell
        
        return cell.frame.height
    }
}
