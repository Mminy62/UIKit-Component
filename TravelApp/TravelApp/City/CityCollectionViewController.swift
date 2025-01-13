//
//  CityCollectionViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/7/25.
//

import UIKit

class CityCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    let cityList = CityInfo().city
    var dataList = CityInfo().city
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var controlView: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150 , height: 300)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
        controlView.addTarget(self, action: #selector(tapped), for: UIControl.Event.valueChanged)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        cell.configureData(row: dataList[indexPath.row])
        
        return cell
    }
    
    @objc func tapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            dataList = cityList
        case 1:
            dataList = cityList.filter { $0.domestic_travel }
        case 2:
            dataList = cityList.filter { !$0.domestic_travel }
        default:
            return
        }
        collectionView.reloadData()
    }

}
