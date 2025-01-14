//
//  MarketViewController.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit
import Alamofire
import SnapKit

struct Coin: Decodable {
    let market: String?
    let korean: String
    let english: String
    
    enum CodingKeys: String, CodingKey {
        case market
        case korean = "korean_name"
        case english = "english_name"
    }
}

class MarketViewController: UIViewController {
 
    let tableView = UITableView()
    
    let list = Array(1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureTableView()
        callRequest()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.backgroundColor = .white
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.id)
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func callRequest() {
        let url = "https://api.upbit.com/v1/market/all"
        
        AF.request(url, method: .get)
        // 이 상태코드는 API를 제공하는 회사가 주는 처리
        // success의 기준은 상태코드 200, 200-209가 기본적으로 success로 구분함(alamofire)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [Coin].self) { response in
            switch response.result {
                
            case .success(let value):
//                self.list = value.documents
                dump(value)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension MarketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function, list.count)
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.id, for: indexPath) as? MarketTableViewCell else { return UITableViewCell() }
        
        let data = list[indexPath.row]
        
        cell.nameLabel.text = "마켓 레이블: \(data)"
        
        return cell
    }
    
}
