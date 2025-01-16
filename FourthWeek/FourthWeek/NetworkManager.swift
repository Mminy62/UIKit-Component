//
//  NetworkManager.swift
//  FourthWeek
//
//  Created by 이민영 on 1/16/25.
//

import UIKit
import Alamofire
import Network

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() { }

    // 클로저 안에 클로저가 있기 때문에, @escaping 탈출 키워드가 필요하다.
    func randomUser(completionHandler: @escaping () -> Void) {
        let url = "https://randomuser.me/api/?results=10"
        // 가장 큰 겉의 struct를 담아주어야함
        AF.request(url, method: .get).responseDecodable(of: User.self) { response in
            switch response.result {
                
            case .success(let value):
                let result = value.results[0].name.last
                
                
                completionHandler() // 성공했을 때의 이름을 매개변수로 넣은 completionHandler 실행시키기
//                self.nameLabel.text = value.results[0].name.title
            case .failure(let error):
                print(error)
            }
        }
    }
}

class NetworkMonitor {
    let monitor = NWPathMonitor()

    
}
