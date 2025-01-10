//
//  NumberCollectionViewController.swift
//  UpDownProject
//
//  Created by 이민영 on 1/9/25.
//

import UIKit

private let cellIdentifier = "NumberCollectionViewCell"

class GameViewController: UIViewController {
    var originList: [Int] = Array(1...100).sorted()
    lazy var filteredList:[Int] = originList
    var maxNumber: Int = 100
    var tryCount: Int = 0
    var selectedIndex: Int? = nil
    var answer: Int = 0
    var titleString: String = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var numberCollectionView: UICollectionView!
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.main
        configureUI()
        
        numberCollectionView.delegate = self
        numberCollectionView.dataSource = self
        let xib = UINib(nibName: cellIdentifier, bundle: nil)
        numberCollectionView.register(xib, forCellWithReuseIdentifier: cellIdentifier)
        
        originList = Array(1...maxNumber)
        answer = Int.random(in: 1...maxNumber)
        print(answer)
    }
    
    
    func configureUI() {
        titleLabel.titleStyle(text: "UP DOWN")
        subTitleLabel.text = "시도 횟수: \(tryCount)"
        subTitleLabel.font = UIFont.systemFont(ofSize: 20)
        subTitleLabel.textAlignment = .center
        resultButton.configureStyle(text: "결과 확인하기")
        resultButton.isEnabled = false
        numberCollectionView.backgroundColor = .clear
        
        resultButton.addTarget(self, action: #selector(resultButtonTapped), for: .touchUpInside)
        
        configureCollectionLayout()
    }
    
    private func configureCollectionLayout() {
        let sectionInset: CGFloat = 16
        let cellSpacing: CGFloat = 16
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = ( UIScreen.main.bounds.width - sectionInset * 2 - cellSpacing * 2 )
        layout.itemSize = CGSize(width: deviceWidth / 6, height: deviceWidth / 6)
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionInset, bottom: 0, right: sectionInset)
        layout.scrollDirection = .horizontal
        layout.collectionView?.backgroundColor = UIColor.main
        numberCollectionView.collectionViewLayout = layout
    }
    
    func gameLogic() {
        guard let idx = selectedIndex else { return }
        if answer == filteredList[idx] {
            titleString = "GOOD!"
            selectedIndex = idx
            
        } else if answer > filteredList[idx] { // up
            filteredList = Array(filteredList[(idx + 1)...])
            titleString = "UP"
            selectedIndex = nil
        } else {
            filteredList = Array(filteredList[..<idx])
            titleString = "DOWN"
            selectedIndex = nil
        }
        
        tryCount += 1
        subTitleLabel.text = "시도 횟수: \(tryCount)"
    }
    
    @objc func resultButtonTapped() {
        gameLogic()
        numberCollectionView.reloadData()
        titleLabel.text = titleString
    }
}


extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        resultButton.backgroundColor = .black
        resultButton.isEnabled = true
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 여기선 for가 항상 필요하고, tableview는 없어도됨. 왜그럴까?
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! NumberCollectionViewCell
        
        
        
        // refactor: 코드 공통 제거(cell쪽에 옮기기)
        if let item = selectedIndex, item == indexPath.item {
            cell.backgroundColor = .black
            cell.contentLabel.text = "\(filteredList[indexPath.item])"
            cell.contentLabel.textColor = .white
        } else {
            cell.backgroundColor = .white
            cell.contentLabel.text = "\(filteredList[indexPath.item])"
            cell.contentLabel.textColor = .black
        }
        
        cell.layer.cornerRadius = cell.frame.height / 2
        
        return cell
    }
}
