//
//  RankViewController.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit
import Alamofire

class RankViewController: UIViewController, UITextFieldDelegate {
    private let apiKey = "acfa8d4399a21fe8c04d1fafebc129de"
    var movieData: Movie?
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜를 입력하세요"
        textField.textColor = .white
        return textField
    }()
    let textFieldBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(RankViewController.self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.stopAnimating()
        
        return activityIndicator
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(searchTextField)
        view.addSubview(textFieldBarView)
        view.addSubview(searchButton)
        view.addSubview(collectionView)
        view.addSubview(activityIndicator)
        
        searchTextField.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(RankCollectionViewCell.self, forCellWithReuseIdentifier: RankCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        
        createItemLayout()
        
        // MARK: 첫 빌드 시 어제 날짜 보여주기
        let yesterday = Date().convertToYesterday().convertToString(format: "yyyyMMdd")
        getData(date: yesterday)
    }
    
    func createCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 40, height: 50)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        return layout
        
    }
    
    func createItemLayout(){
        searchTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(50)
        }
        
        textFieldBarView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(3)
        }
        
        searchButton.snp.makeConstraints { make in
            make.bottom.equalTo(textFieldBarView.snp.bottom)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(textFieldBarView.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20) // 추가
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func getData(date: String) {
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(apiKey)&targetDt=\(date)"
        AF.request(url, method: .get).responseDecodable(of: Movie.self) { response in
            switch response.result {
                
            case .success(let value):
                self.movieData = value
                self.collectionView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func searchButtonTapped() {
        if let date = searchTextField.text, !date.trimmingCharacters(in: .whitespaces).isEmpty {
            getData(date: date)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

extension RankViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let movieData {
            activityIndicator.stopAnimating()
            return movieData.boxOfficeResult.dailyBoxOfficeList.count
        } else {
            activityIndicator.startAnimating()
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankCollectionViewCell.identifier, for: indexPath) as! RankCollectionViewCell
        if let movieList = movieData?.boxOfficeResult.dailyBoxOfficeList {
            cell.configureData(row: movieList[indexPath.item])
        }
        return cell
    }
}
