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
    var page: Int = 1
    var isEnd = false
    var searchItem: String = "swift"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureSearchBar()
        configureTableView()
        callRequest()
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
        tableView.prefetchDataSource = self
        tableView.register(KakaoBookSearchTableViewCell.self, forCellReuseIdentifier: KakaoBookSearchTableViewCell.id)
    }
}

extension KakaoBookSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 스위프트 쿼리를 통해 카카오 책 API 호출
        if let searchText = searchBar.text, searchText.trimmingCharacters(in: .whitespaces).count != 0 {
            searchItem = searchText
            page = 1 // 초기화
            bookList.removeAll()
            callRequest()
        }
        print(#function)
        view.endEditing(true)
    }
    
    func callRequest() {
        print(#function)
        let url = "https://dapi.kakao.com/v3/search/book?query=\(searchItem)&size=20&page=\(page)"
        let headers: HTTPHeaders = [HTTPHeader(name: "Authorization", value: APIKey.kakao)]
        
        AF.request(url, method: .get, headers: headers)
        // 이 상태코드는 API를 제공하는 회사가 주는 처리
        // success의 기준은 상태코드 200, 200-209가 기본적으로 success로 구분함(alamofire)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: Book.self) { response in
                switch response.result {
                    
                case .success(let value):
                    self.isEnd = value.meta.is_end
                    if value.documents.count == 0 { // data가 없을 때
                        self.bookList.removeAll()
                        print("검색 결과가 없습니다")
                        self.tableView.reloadData()
                    } else {
                        self.bookList.append(contentsOf: value.documents)
                        if self.page == 1 {
                            self.tableView.reloadData()
                            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true) // data가 있어야하는 scrollToRow
                        }
                    }
        
                    //                    self.bookList.append(contentsOf: value.documents)
                    //                    self.tableView.reloadData()
                    //                    if self.page == 1 {
                    //                        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
                    //                    }
                    
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
        //        print(#function)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KakaoBookSearchTableViewCell.id, for: indexPath) as? KakaoBookSearchTableViewCell else { return UITableViewCell() }
        
        let data = bookList[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.overviewLabel.text = data.contents
        cell.thumbnailImageView.kf.setImage(with: URL(string: data.thumbnail))
        cell.priceLabel.text = String(data.price)
        return cell
        
    }
    
    //    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //        print(#function)
    //    }
    
    // UIScrollview 상속받은 함수이기에 따로 선언안해줘도 호출됨
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        print(#function, scrollView.contentOffset.x, scrollView.contentOffset.y)
    //    }
}


extension KakaoBookSearchViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        //        print(#function, indexPaths)
        // 20
        for item in indexPaths {
            print(item.row)
            if !bookList.isEmpty && bookList.count - 2 == item.row && !isEnd {
                page += 1
                callRequest()
            }
        }
    }
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print(#function)
    }
}
