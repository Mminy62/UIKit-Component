//
//  TravelTableViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    private var travelList = TravelInfo().travel
    
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
        let cell = returnCellView(index: indexPath.row) // travel_image가 nil이면 AdCell로 파악
        
        // cell의 데이터타입에 따라 선정
        if type(of: cell) == AdTableViewCell.self {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "adCell") as! AdTableViewCell
            cell.configureUI()
            cell.titleLabel.text = travelItem.title
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell") as! TravelTableViewCell
            cell.configureUI()
            setImageView(index: indexPath.row, imageView: cell.posterImageView)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            cell.likeButton.setImage(UIImage(systemName: travelItem.like! ? "heart.fill" : "heart"), for: .normal)
            cell.titleLabel.text = travelItem.title
            cell.subtitleLabel.text = travelItem.description
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            cell.saveLabel.text = "저장 \(numberFormatter.string(for: travelItem.save)!)"
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        travelList[sender.tag].like?.toggle()
        tableView.reloadData()
    }
    
    private func setImageView(index: Int, imageView: UIImageView) {
        if let url = travelList[index].travel_image {
            imageView.kf.setImage(with: URL(string: url))
            imageView.layer.cornerRadius = 10
            imageView.contentMode = .scaleAspectFill
        }
    }
    
    private func returnCellView(index: Int) -> UITableViewCell {
        var cell: UITableViewCell
        
        if travelList[index].ad == true {
            cell = tableView.dequeueReusableCell(withIdentifier: "adCell") as! AdTableViewCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "travelCell") as! TravelTableViewCell
        }
        return cell
    }
}
