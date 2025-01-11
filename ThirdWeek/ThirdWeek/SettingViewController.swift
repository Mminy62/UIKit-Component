//
//  SettingTableViewController.swift
//  ThirdWeek
//
//  Created by 이민영 on 1/10/25.
//

import UIKit
// String은 프로토콜은 아님(raw value type은 꼭 앞에 해야함)
// Case Iterable => case를 배열로 표현해줄 수 있음(all Cases)
enum SettingOptions: Int, CaseIterable {
    case total
    case personal
    case others
    
    var mainOption: String {
        switch self {
        case .total:
            "전체 설정"
        case .personal:
            "개인 설정"
        case .others:
            "기타"
        }
    }
    
    var subOption: [String] {
        switch self {
        case .total:
            ["공지사항", "실험실", "버전정보"]
        case .personal:
            ["개인/보안", "알림", "채팅"]
        case .others:
            ["고객센터/도움말"]
        }
    }
}

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let sectionList: [SettingOptions] = SettingOptions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView, section: Int) -> Int {
        return SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return SettingOptions.allCases[section].subOption.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(SettingOptions.allCases[section].mainOption, section)
        return SettingOptions.allCases[section].mainOption
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell")!
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOption[indexPath.row]
        return cell
    }
    
    
}

