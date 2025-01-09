//
//  SampleCollectionViewController.swift
//  ThirdWeek
//
//  Created by 이민영 on 1/9/25.
//

import UIKit

class SampleCollectionViewController: UIViewController {
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var searchBarView: UISearchBar!
    
    let list: [Int] = Array<Int>(1...100)

//    var dataList: [Int] = Array<Int>(1...100)
    // 필터링된 데이터 - 초기화 시점이 미뤄지도록 진행하면
    lazy var dataList: [Int] = list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarView.delegate = self
        configureCollectionViewLayout()
        configureCollectionView()
        configureListCollectionViewLayout()
        configureUI()
    }
    func configureUI() {
        //        searchBarView.showsCancelButton = true
    }
    
    func configureCollectionView() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        
        listCollectionView.delegate = self
        listCollectionView.dataSource = self
        
        let id = SampleCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        bannerCollectionView.register(xib, forCellWithReuseIdentifier: id)
        listCollectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    func configureCollectionViewLayout() {
        bannerCollectionView.isPagingEnabled = true
        bannerCollectionView.backgroundColor = .black
        // static 으로 바꾼 순간 인스턴스, 프로퍼티로 인식하지 못해서 명시해줘야한다.
        bannerCollectionView.collectionViewLayout = SampleCollectionViewController.configureViewLayout()
    }
    
    func configureListCollectionViewLayout() {
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - sectionInset * 2 - cellSpacing * 2
        
        layout.itemSize = CGSize(width: deviceWidth / 3, height: deviceWidth / 3)
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        
        //        layout.minimumLineSpacing
        //        layout.minimumInteritemSpacing
        
        // 왕중요!!!!!!!
        listCollectionView.collectionViewLayout = layout
    }
    
}

extension SampleCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //        searchBarView.showsCancelButton = false
        searchBarView.setShowsCancelButton(false, animated: true)
        view.endEditing(true)
    }
    // x button 아님 => 취소 글씨가 나오는 곳이 있어서, ui 설정 해줘야함
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarView.text = ""
        searchBarView.setShowsCancelButton(false, animated: true)
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //        searchBarView.showsCancelButton = true
        searchBarView.setShowsCancelButton(true, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function)
        
        var result: [Int] = []
        
        if searchText == "" {
            result = list
        } else {
            let num = Int(searchText)!
            if list.contains(num) {
                result = [num]
            }
        }
        dataList = result
        listCollectionView.reloadData()
    }
}


// MARK: CollectionView 설정
extension SampleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SampleCollectionViewCell", for: indexPath) as! SampleCollectionViewCell
        cell.index = indexPath.item
        cell.backgroundColor = .red
        cell.posterImageView.backgroundColor = .white
        cell.titleLabel.text = "\(dataList[indexPath.item])"
        //
        //        DispatchQueue.main.async { // 나중에 실행되게 바꾼다는 뜻
        //            cell.posterImageView.layer.cornerRadius = cell.posterImageView.frame.width / 2
        //        }
        
        cell.posterImageView.layer.cornerRadius = cell.posterImageView.frame.height / 2
        
        return cell
    }
}
