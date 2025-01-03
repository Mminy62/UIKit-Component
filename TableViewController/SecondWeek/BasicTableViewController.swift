//
//  BasicTableViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/2/25.
//

import UIKit

class BasicTableViewController: UITableViewController {
    
    var list = ["프로젝트", "메인업무", "오류", "새싹", "오징어"] {
        didSet {
            tableView.reloadData()
        }
    }
    var age = 16
//    var monster = Monster(clothes: "ddd")
//    var monsterStruct = MonsterStruct(clothes: <#T##String#>, speed: <#T##Int#>, power: <#T##Int#>, experience: <#T##Int#>, name: <#T##String#>)

    // 짝수 gray, 홀수 white,
    
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet var minTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 1. 셀의 개수: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    
    // 2. 셀 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "minCell")
        cell?.detailTextLabel?.setPrimaryLabel("Detail??")
        cell?.textLabel?.text = list[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        cell?.backgroundColor = indexPath.row % 2 == 1 ? UIColor.red : UIColor.green

        
        print(#function, indexPath.row)
        return cell!
    }

    // 3. 셀 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // cell 마다 높이가 다를 수 있기 때문에, cellForRowAt 함수처럼 셀을 생성할때마다 호출된다.
        return 80.5
    }
    
    // 셀을 클릭했을 때
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 데이터를 지워야함
        list.remove(at: indexPath.row)
    }
    
    @IBAction func randomButtonTapped(_ sender: UIBarButtonItem) {
        let names = list.shuffled()
        list.append(names.randomElement()!)
    }
    
    
    @IBAction func updateButtonTapped(_ sender: UIButton) {
        
    }
    
    

}
