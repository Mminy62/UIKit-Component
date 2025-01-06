//
//  ShoppingTableViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/4/25.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var headerBackgroundView: UIView!
    
    private var shopList = ShopInfo().shopList

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = "쇼핑"
        itemTextField.placeholder = "무엇을 구매하실건가요?"
        itemTextField.borderStyle = .none
        itemTextField.font = UIFont.systemFont(ofSize: 16.0)
        
        addButton.setTitle("추가", for: .normal)
        addButton.backgroundColor = UIColor.systemGray4
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        
        headerView.backgroundColor = .white
        headerBackgroundView.backgroundColor = .systemGray6
        headerBackgroundView.layer.cornerRadius = 10

    }
    
    private func getItemName() -> String? {
        if itemTextField.text?.trimmingCharacters(in: .whitespaces).count != 0 {
            return itemTextField.text!
        }
        return nil
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let item = getItemName() else {
            return
        }
        shopList.append(Shop(title: item, purchase: false, like: false))
        itemTextField.text = nil
        tableView.reloadData()
    }
    
    @IBAction func returnKeyTapped(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! ShopTableViewCell
        let shopItem = shopList[indexPath.row]
        cell.configureData(row: shopItem)
        
        // 버튼 태그 입력
        cell.checkButton.tag = indexPath.row
        cell.likeButton.tag = indexPath.row
        cell.checkButton.accessibilityIdentifier = "checkButton"
        cell.likeButton.accessibilityIdentifier = "likeButton"
        
        cell.checkButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        cell.likeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shopList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } 
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let senderId = sender.accessibilityIdentifier else { return }
        if senderId == "checkButton" {
            shopList[sender.tag].purchase.toggle()
        } else {
            shopList[sender.tag].like.toggle()
        }
        tableView.reloadData()
    }
    
    @IBAction func returnTapped(_ sender: UITextField) {
        view.endEditing(true)
    }
    
}
