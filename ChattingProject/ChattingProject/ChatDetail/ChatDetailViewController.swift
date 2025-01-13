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
    @IBOutlet weak var textFieldConstraint: NSLayoutConstraint!
    
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureUI() {
        navigationItem.title = chatInfo?.chatroomName
        tableView.separatorStyle = .none
        tableView.scrollToRow(at:  IndexPath(row: chatInfo!.chatList.count - 1, section: 0), at: .bottom, animated: true)
        
        sendButton.setImage(UIImage(named: "arrowshape.turn.up.right"), for: .normal)
        messageTextField.backgroundColor = .systemGray6
        messageTextField.textColor = .black
        messageTextField.placeholder = "메세지를 입력하세요"
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {
        if messageTextField.isEditing {
            moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.textFieldConstraint, keyboardWillShow: true)
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.textFieldConstraint, keyboardWillShow: false)
    }
    
    // MARK: 키보드와 같이 textfield 올리기
    func moveViewWithKeyboard(notification: NSNotification, viewBottomConstraint: NSLayoutConstraint, keyboardWillShow: Bool) {
        // 키보드 사이즈
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardHeight = keyboardSize.height
        let keyboardDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        
        // Keyboard's animation curve
        let keyboardCurve = UIView.AnimationCurve(rawValue: notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!
        
        // textfield view constraint 변경
        if keyboardWillShow {
            let safeAreaExists = (self.view?.window?.safeAreaInsets.bottom != 0) // Check if safe area exists
            let bottomConstant: CGFloat = 20
            viewBottomConstraint.constant = keyboardHeight + (safeAreaExists ? 0 : bottomConstant)
        }else {
            viewBottomConstraint.constant = 20
        }
        
        let animator = UIViewPropertyAnimator(duration: keyboardDuration, curve: keyboardCurve) { [weak self] in
            self?.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    // Refactor: 메세지 있으면 보내는 것 해보기(데이터 추가)
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        print(Date())
        //        Chat(user: .user, date: Date(), message: "")
        view.endEditing(true)
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
