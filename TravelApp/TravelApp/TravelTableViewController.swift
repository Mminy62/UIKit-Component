//
//  TravelTableViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    var travelList = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "도시 상세 정보"
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelItem = travelList[indexPath.row]
        
        let cell = returnCellView(index: indexPath.row)
        
        
        // image가 nil이면 다른 셀로 분류
        if type(of: cell) == AdTableViewCell.self {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "adCell") as! AdTableViewCell
            
            cell.titleLabel.text = travelItem.title
            cell.titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
            cell.titleLabel.numberOfLines = 2
            cell.titleLabel.textAlignment = .center
            
            cell.adLabel.text = " AD "
            cell.adLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
            
            cell.adBackgroundView.backgroundColor = .white
            cell.adBackgroundView.layer.cornerRadius = 5
            
            
            cell.backView.backgroundColor = UIColor.systemPink
            cell.backView.layer.cornerRadius = 10
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell") as! TravelTableViewCell
            
            setImageView(index: indexPath.row, imageView: cell.posterImageView)
            
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            cell.likeButton.setImage(UIImage(systemName: travelItem.like! ? "heart.fill" : "heart"), for: .normal)
            cell.likeButton.tintColor = .white
            
            cell.titleLabel.text = travelItem.title
            cell.titleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
            cell.titleLabel.textColor = .black
            
            cell.subtitleLabel.text = travelItem.description
            cell.subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            cell.subtitleLabel.textColor = .gray
            cell.subtitleLabel.numberOfLines = 2
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            cell.saveLabel.text = "저장 \(numberFormatter.string(for: travelItem.save)!)"
            cell.saveLabel.textColor = .systemGray2
            cell.saveLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            
            return cell
        }

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cell: UITableViewCell
        
        cell = returnCellView(index: indexPath.row)
        
        return cell.frame.height
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        travelList[sender.tag].like?.toggle()
        tableView.reloadData()
    }
    
    func setImageView(index: Int, imageView: UIImageView) {
        if let url = travelList[index].travel_image {
            imageView.kf.setImage(with: URL(string: url))
            imageView.layer.cornerRadius = 10
            imageView.contentMode = .scaleAspectFill
        }
    }
    
    func returnCellView(index: Int) -> UITableViewCell {
        var cell: UITableViewCell
        
        if travelList[index].travel_image == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: "adCell") as! AdTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "travelCell") as! TravelTableViewCell
        }
        
        return cell
    }
    
    
}
