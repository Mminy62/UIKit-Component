//
//  ChatDetailViewController.swift
//  ChattingProject
//
//  Created by 이민영 on 1/12/25.
//

import UIKit

class ChatDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var chatInfo: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let friendNib = UINib(nibName: FriendTableViewCell.identifier, bundle: nil)
        tableView.register(friendNib, forCellReuseIdentifier: FriendTableViewCell.identifier)
        let userNib = UINib(nibName: UserTableViewCell.identifier, bundle: nil)
        tableView.register(userNib, forCellReuseIdentifier: UserTableViewCell.identifier)
        
        
        configureUI()
    }
    
    func configureUI() {
        navigationItem.title = chatInfo?.chatroomName
        tableView.separatorStyle = .none
        
        sendButton.setImage(UIImage(named: "arrowshape.turn.up.right"), for: .normal)
        messageTextField.backgroundColor = .systemGray6
        messageTextField.textColor = .black
        messageTextField.placeholder = "메세지를 입력하세요"
    }
    
}

extension ChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let chatInfo {
            return chatInfo.chatList.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = chatInfo!.chatList[indexPath.row]
    
        switch item.user {
        case .user:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as! UserTableViewCell
            cell.configureUI(data: item)
            
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier) as! FriendTableViewCell
            cell.configureUI(data: item)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
