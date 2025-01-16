//
//  CodeCollectionViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/13/25.
//

import UIKit
import SnapKit
import Network


class CodeCollectionViewController: UIViewController {
    
    var mainView = CodeView()
    let monitor = NWPathMonitor()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultsManager.shared.age = 50
        NetworkManager.shared.randomUser { name in
            print("\(name) 입니다.")
        }
        
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                
                DispatchQueue.main.async {
                    print("connet")
                }
            } else {
                
                DispatchQueue.main.async {
                    print("nope")
                }
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
    
}

extension CodeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CodeCollectionViewCell.identifier, for: indexPath) as! CodeCollectionViewCell
        
        cell.bookCoverImageView.layer.cornerRadius = 10
        return cell
    }
}
