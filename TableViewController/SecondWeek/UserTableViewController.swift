//
//  UserTableViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/3/25.
//

import UIKit
import Kingfisher

class UserTableViewController: UITableViewController {
    
    var friends = FriendsInfo().list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "타이틀"
        let star = UIImage(systemName: "star")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: star, style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        
        // xib cell 을 등록하는 과정
//        let nib = UINib(nibName: "NoProfileTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "NoProfileTableViewCell")
    }
    
    @objc
    func rightBarButtonItemTapped() {
        print(#function)
        // 1. 어떤 스토리보드에서 가져올건지 선택
        let sb = UIStoryboard(name: "User", bundle: nil)
        // 2. 전환할 뷰 컨트롤러 가져오기 BrownVC
        let vc = sb.instantiateViewController(withIdentifier: "GrayViewController") as! GrayViewController
        // 3. 화면 전환 방법 선택하기 - 우측에서 등장 show / navi / push
        // push는 navigationController가 있어야함
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: TableView Data
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. 어떤 스토리보드에서 가져올건지 선택
        let sb = UIStoryboard(name: "User", bundle: nil)
        // 2. 전환할 뷰 컨트롤러 가져오기 BrownVC
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        // 값 전달 시 아웃렛 활용할 없음
        
        // 2 Pass Data - vc가 갖고 있는 프로퍼티에 데이터 추가
        vc.contents = friends[indexPath.row].name
        // A -> B로 갈 때, B 컨텐츠로 바꾼 후 통합시킴
        
        
        // (옵션1)어떤 modalPresentationStyle 지정했냐에 따라 modalTransitionStyle 이 적용이 안되거나 런타임 이슈가 생기는 케이스 존재
        // modalPresentationStyle - fullScreen이 아니면, TransitionStyle - particalCurl(책장 넘기기) 못함
        vc.modalPresentationStyle = .fullScreen //
        vc.modalTransitionStyle = .crossDissolve // 전환 애니메이션
        // 3. 화면 전환 방법 선택하기 - 아래에서 위로 / modal / present
//        present(vc, animated: true)
        
        // (옵션2) present 지만, navi title도 쓰고 싶다면, 다시 네비케이션 컨트롤러를 임베드 해서, 컨트롤러를 present
        let nav = UINavigationController(rootViewController: vc) // vc를 nav로 만들어주기
        
        present(nav, animated: true)
//        navigationController?.pushViewController(vc, animated: true) // entry point를 userTableView에 해놓으면, navigationController가 없어서, 이 코드는 실행이 안됨
        
        tableView.reloadRows(at: [indexPath], with: .fade) // 더 자연스러운 selectRow
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! UserTableViewCell
//         let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! UserTableViewCell // 이렇게 하면 터짐
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friend = friends[indexPath.row]
        
        // cell view에서 일어나는 것을 제어하는 역할이 viewController이므로, indexPath, action의 경우는 viewController에 두는 편임

        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell // index 번호까지 붙여서 확인
//        let tempCell = tableView.dequeueReusableCell(withIdentifier: "NoProfileTableViewCell", for: indexPath) as! NoProfileTableViewCell
        
        
        cell.configureData(row: friend) // 코드 분리이지, 역할을 나눠 VC의 부담을 덜어준 것은 아님. 조금이라도 private으로 안에 like button만 나오게 하면 좀 나음
        cell.likeButton.setImage(UIImage(systemName: friend.like ? "heart.fill" : "heart"), for: .normal)
        cell.likeButton.tag = indexPath.row // button tag 값 부여
        // selector(함수 이름) 만으로 호출되는 이유 - Fuction Types: 클로저, 일급객체
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        
        return cell
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        friends[sender.tag].like.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
}
