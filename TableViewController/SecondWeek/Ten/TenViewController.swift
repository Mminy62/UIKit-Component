//
//  TenViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/7/25.
//

import UIKit

/*
 1. 테이블 뷰 생성
 2. 테이블 뷰 부하직원 (프로토콜) UITableViewDelegate, UITableViewDataSource
 3. 필수 기능
 4. 테이블 뷰와 부하직원이 서로 연결(= 타입으로서 프로토콜, protocol as type)
 */

class TenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
        tableView.rowHeight = 100
        
        
        // 4. 테이블 뷰와 부하직원이 서로 연결(= 타입으로서 프로토콜, protocol as type)
        tableView.delegate = self
        tableView.dataSource = self
        // 상속만으로는 안되나보네...?
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        cell.backgroundColor = .red
        return cell
    }
    

}
