//
//  RandomViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire

struct User: Decodable {
    let results: [UserDetail]
//    let info: Info
    
}

//struct Info: Decodable {
//    
//}

struct UserDetail: Decodable {
    let gender: String
    let name: NameDetail
    let email: String
    let phone: String
}

struct NameDetail: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Lotto: Decodable {
    let drwNoDate: String
    let firstWinamnt: Int
}

struct Dog: Decodable {
    let message: String
    let status: String
}

protocol ViewConfiguration: AnyObject { // 클래스에만 사용하게
    func configureHierarchy() // addSubView
    func configureLayout() // snapKit
    func configureView() // property
}

class RandomViewController: UIViewController, ViewConfiguration {
    
    let dogImageView = UIImageView()
    let randomButton = UIButton()
    let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(dogImageView)
        view.addSubview(randomButton)
        view.addSubview(nameLabel)
        
    }
    
    func configureLayout() {
        dogImageView.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(dogImageView.snp.bottom).offset(20)
        }
        
        randomButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
    
    func configureView() {
        dogImageView.backgroundColor = .brown
        nameLabel.backgroundColor = .yellow
        randomButton.backgroundColor = .blue
        randomButton.setTitle("버튼", for: .normal)
        randomButton.setTitleColor(.black, for: .normal)
        randomButton.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
    }

    @objc
    func randomButtonTapped() {
        // 버튼 누르면 랜덤으로 강아지 나오게
        // 요청 url, responseString - response를 string으로 받는 함수
        let url = "https://dog.ceo/api/breeds/image/random"
//        AF.request(url, method: .get).responseString { value in
//            print(value)
//        }
        
        print("====1111=====")
        // struct로 decoding 된 상태
        AF.request(url, method: .get).responseDecodable(of: Dog.self) { response in
            print("====2222=====")
            
            switch response.result {
                
            case .success(let value):
                print("success")
                self.nameLabel.text = value.message
                // self 없이 불가능 왜? =>
                
                print(value.message)
                print(value.status)
            case .failure(let error):
                print("error")
                print(error)
            }
            print("====3333=====")
        }
        
        print("====4444=====")
    }
    
    @objc
    func lottoButtonTapped() {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=888"
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
                
            case .success(let value):
                self.nameLabel.text = value.drwNoDate + " \(value.firstWinamnt)"
                print(value.firstWinamnt.formatted())
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc
    func userButtonTapped() {
        let url = "https://randomuser.me/api/?results=10"
        // 가장 큰 겉의 struct를 담아주어야함
        AF.request(url, method: .get).responseDecodable(of: User.self) { response in
            switch response.result {
                
            case .success(let value):
                self.nameLabel.text = value.results[0].name.title
            case .failure(let error):
                print(error)
            }
        }
    }
}
