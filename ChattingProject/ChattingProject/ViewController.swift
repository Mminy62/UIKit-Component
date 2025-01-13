//
//  ViewController.swift
//  ChattingProject
//
//  Created by 이민영 on 1/11/25.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var chatListCollectionView: UICollectionView!
    var filteredList: [ChatRoom] = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        searchBarView.delegate = self
        
//        let chatListNib = UINib(nibName: ChatListCollectionViewCell.identifier, bundle: nil)
//        chatListCollectionView.register(chatListNib, forCellWithReuseIdentifier: ChatListCollectionViewCell.identifier)
        let multipleNib = UINib(nibName: ChatListCollectionViewCell.identifier, bundle: nil)
        chatListCollectionView.register(multipleNib, forCellWithReuseIdentifier: ChatListCollectionViewCell.identifier)
        configureUI()
    }
    
    func configureUI() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        navigationItem.title = "TRAVEL TALK"
        searchBarView.placeholder = "친구 이름을 검색해보세요"
        let collectionWidth = chatListCollectionView.frame.width
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: collectionWidth, height: collectionWidth / 5)
        layout.minimumLineSpacing = 20
        chatListCollectionView.collectionViewLayout = layout
    }
    
    // MARK: SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard var content = searchBar.text else { return }
        
        if content.trimmingCharacters(in: .whitespaces).count == 0 {
            filteredList = mockChatList
        } else {
            content = content.lowercased() // 검색 소문자 처리
            filteredList = mockChatList.filter { $0.chatroomName.lowercased().contains(content) }
        }
        chatListCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = filteredList[indexPath.item]
        
            let cell = chatListCollectionView.dequeueReusableCell(withReuseIdentifier: ChatListCollectionViewCell.identifier, for: indexPath) as! ChatListCollectionViewCell
            
            cell.configureData(item: filteredList[indexPath.item])
            return cell
        
//            let cell = chatListCollectionView.dequeueReusableCell(withReuseIdentifier: ChatListCollectionViewCell.identifier, for: indexPath) as! ChatListCollectionViewCell
//            
//            cell.configureData(item: filteredList[indexPath.item])
//            return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChatDetailViewController") as? ChatDetailViewController else { return }
        nextVC.chatInfo = filteredList[indexPath.item]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
