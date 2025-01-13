//
//  MultipleChatCollectionViewCell.swift
//  ChattingProject
//
//  Created by 이민영 on 1/13/25.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    static let identifier = "ChatListCollectionViewCell"
    @IBOutlet weak var profileCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var chatInfo: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [""], chatroomName: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        let nib = UINib(nibName: ProfileCollectionViewCell.identifier, bundle: nil)
        profileCollectionView.register(nib, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    
        configureLayout()
        configureUI()
    }
    
    func configureData(item: ChatRoom) {
        nameLabel.text = item.chatroomName
        messageLabel.text = item.chatList.last?.message
        dateLabel.text = item.chatList.last?.date.convertToDateString(formatString: "yy.MM.dd")
        chatInfo = item
        
        let layout = UICollectionViewFlowLayout()
        var collectionWidth = profileCollectionView.frame.width
        collectionWidth = collectionWidth / (item.chatroomImage.count > 1 ? 2 : 1)
        layout.itemSize = CGSize(width: collectionWidth, height: collectionWidth)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        profileCollectionView.collectionViewLayout = layout
    }
    
    private func configureUI() {
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .gray
        dateLabel.textColor = .gray
        dateLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func configureLayout() {
        
    }
}

extension ChatListCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return chatInfo.chatroomImage.count > 4 ? 4 : chatInfo.chatroomImage.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = profileCollectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
        let clipsToImageFlag = chatInfo.chatroomImage.count == 1 ? true : false
        cell.configureUI(imageName: chatInfo.chatroomImage[indexPath.item], cornerFlag: clipsToImageFlag)
        return cell
    }
}
