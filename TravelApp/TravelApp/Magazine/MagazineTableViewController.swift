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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell") as! MagazineTableViewCell
        let magazineItem = magazineList[indexPath.row]
        cell.configureData(row: magazineItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
