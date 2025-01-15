//
//  KakaoBookSearchViewController.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class KakaoBookSearchViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    var bookList: [BookDetail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureSearchBar()
        configureTableView()
        callRequest(content: "swift")
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        searchBar.delegate = self
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
        
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = 120
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(KakaoBookSearchTableViewCell.self, forCellReuseIdentifier: KakaoBookSearchTableViewCell.id)
    }
}

extension KakaoBookSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 스위프트 쿼리를 통해 카카오 책 API 호출
        
        if let searchText = searchBar.text, searchText.trimmingCharacters(in: .whitespaces).count != 0 {
            callRequest(content: searchText)
        }
        print(#function)
        view.endEditing(true)
    }
    
    func callRequest(content: String) {
        print(#function)
        let url = "https://dapi.kakao.com/v3/search/book?query=\(content)"
        let headers: HTTPHeaders = [HTTPHeader(name: "Authorization", value: APIKey.kakao)]
        
        AF.request(url, method: .get, headers: headers)
        // 이 상태코드는 API를 제공하는 회사가 주는 처리
        // success의 기준은 상태코드 200, 200-209가 기본적으로 success로 구분함(alamofire)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Book.self) { response in
            switch response.result {
                
            case .success(let value):
                self.bookList = value.documents
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}


extension KakaoBookSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        guard let bookList else { return 1 }
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KakaoBookSearchTableViewCell.id, for: indexPath) as? KakaoBookSearchTableViewCell else { return UITableViewCell() }
        
        let data = bookList[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.overviewLabel.text = data.contents
        cell.thumbnailImageView.kf.setImage(with: URL(string: data.thumbnail))
        cell.priceLabel.text = String(data.price)
        return cell
        
    }
    
}

