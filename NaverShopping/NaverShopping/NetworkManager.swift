//
//  NetworkManager.swift
//  NaverShopping
//
//  Created by 이민영 on 1/17/25.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    // shopData removeAll
    func callSearchRequest(_ item: String, _ pos: Int, _ sortType: SortType, completionHandler: @escaping (Shop) -> () ) {
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(item)&display=30&start=\(pos)&sort=\(sortType.rawValue)"
        let header: HTTPHeaders = APIkey.Naver.value
        
        AF.request(url, method: .get, headers: header)
            .validate()
            .responseDecodable(of: Shop.self) { response in
                switch response.result {
                    
                case .success(let value):
                    completionHandler(value)
                    
                case .failure(let error):
                    print(error)
                }
            }
        
    }
}
