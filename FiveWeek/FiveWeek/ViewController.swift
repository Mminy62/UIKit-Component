//
//  ViewController.swift
//  FiveWeek
//
//  Created by 이민영 on 1/20/25.
//

import UIKit
import Alamofire
import Kingfisher
import SnapKit

class ViewController: UIViewController {
    let firstImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        return view
    }()
    
    let secondImageView = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    let thirdImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let checkButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        //        concurrentSync()
        example2()
    }
    
    func configureView() {
        view.addSubview(firstImageView)
        firstImageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        view.addSubview(secondImageView)
        secondImageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(firstImageView.snp.bottom)
        }
        view.addSubview(thirdImageView)
        thirdImageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(secondImageView.snp.bottom)
        }
        //
        view.addSubview(checkButton)
        checkButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    }
    
    //
    func serialSync() {
        print("START", terminator: " ")
        
        DispatchQueue.main.async {
            for item in 1...100 {
                print(item, terminator: " ")
            }
        }
        
        for item in 101...200 {
            print(item, terminator: " ")
        }
        
        print("END")
    }
    
    func concurrentSync() {
        print("START", terminator: " ")
        
        DispatchQueue.global().async { // 블럭 자체가 task => task 가 언제 끝날지 기다리지 않고 global queue에 들어온 task를 실행한다는 것
            for item in 1...100 {
                print(item, terminator: " ")
            }
            
            for item in 101...200 {
                print(item, terminator: " ")
            }
        }
        
        print("END")
    }
    
    func example() {
        print("start")
        DispatchQueue.global(qos: .userInteractive).async {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        print("step1")
        DispatchQueue.global(qos: .background).async {
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        print("step2")
        DispatchQueue.global().async {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        print("end")
    }
    
    func example2() {
        // 동시에 갱신하고 싶다면 group으로 한다
        let group = DispatchGroup()
        DispatchQueue.global().async(group: group) {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        //        DispatchQueue.global().async(group: group) {
        //            for i in 101...200 {
        //                print(i, terminator: " ")
        //            }
        //        }
        DispatchQueue.global().async(group: group) {
            for i in 101...200 {
                print(i, terminator: " ")
            }
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        print("END")
        
        group.notify(queue: .main) { // 거의 대부분 신호를 받는 것은 ui를 바꾸는게 많기 때문에 main에서 하는게 많다
            print("알바생 3명 일 끝, 신호 받음!")
        }
    }
    
    @objc
    func checkButtonTapped(_ sender: UIButton) {
        print(#function)
        
        let group = DispatchGroup()
        group.enter() // + 1 -> mutex
        NetworkManager.shared.fetchImage { image in
            print("first succeed")
            group.leave() // -1 -> mutex0
        }
        group.enter() // + 1 -> mutex
        NetworkManager.shared.fetchImage { image in
            print("second succeed")
            group.leave()
        }
        group.enter() // + 1 -> mutex
        NetworkManager.shared.fetchImage { image in
            print("third succeed")
            group.leave()
        }
        group.notify(queue: .main) { // 거의 대부분 신호를 받는 것은 ui를 바꾸는게 많기 때문에 main에서 하는게 많다
            print("알바생들 끝남") // 동기 함수에서만 동작한다. -> main & async ->
            // DispatchQueue. background, Network 에서 사용한 alamofire도 확인해야한다. 왜냐면, 이 "알바생들 끝남"은 alamofire에 대한 global로 보낸 후 바로 출력하기 때무네
            // enter, leave를 통해서 관리한다.(들어오면 + 1, -1) notify 될 수 있음
        }
    }
    
}
