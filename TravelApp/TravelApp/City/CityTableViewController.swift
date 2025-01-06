//
//  CityTableViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/6/25.
//

import UIKit

class CityTableViewController: UITableViewController {

    let cityList = CityInfo().city
    var dataList: [City] = CityInfo().city
    
    @IBOutlet weak var controlView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CityTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CityTableViewCell")
        
        controlView.addTarget(self, action: #selector(tapped), for: UIControl.Event.valueChanged)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        let cityItem = dataList[indexPath.row]
        cell.configureData(row: cityItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @objc func tapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dataList = cityList
        case 1:
            dataList = cityList.filter { $0.domestic_travel }
        case 2:
            dataList = cityList.filter { !$0.domestic_travel }
        default:
            return
        }
        tableView.reloadData()
    }
}
