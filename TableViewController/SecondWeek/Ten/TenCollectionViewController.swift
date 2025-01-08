//
//  TenCollectionViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/7/25.
//

import UIKit

/*
 1. 이름 & collectionView IBOutlet 연결
 2. 부하직원(프로토콜) 불러야함 - UICollectionViewDelegate, UICollectionViewDataSource
 // swift 클래스는 여러개 상속받지 못해서 여러 프로토콜을 사용하는 편이다.
 3. 부하직원 역할 = self 로 연결
 4. height, width 설정
 */

class TenCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // UINib으로 구성해도 됨

        let xib = UINib(nibName: "TenCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "TenCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout() // 더 쉽게 쓸 수 있는 기본 flow layout
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumLineSpacing = 20 // 가로줄 여백
        layout.minimumInteritemSpacing = 20 // 세로줄
        // 세로줄이 유독 길게 나옴 왜? greater than eqal이 기본적으로 깔려있음
        // 기기별 width가 다르기때문에
        layout.sectionInset = UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50)
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TenCollectionViewCell", for: indexPath) as! TenCollectionViewCell
        return cell
    }
    

}
