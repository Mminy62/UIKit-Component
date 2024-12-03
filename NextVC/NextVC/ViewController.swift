//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.someString = "안녕?!"
        // firstVC.mainLabel.text = "안녕" // 이렇게 직접적으로 전달하진 않음 => 스토리보드로 만들면 에러나는 코드
        // 코드는 한번에 메모리에 올라감
        // 코드 -> 스토리보드 -> 둘 연결 이런 식으로 메모리에 올라가는 순서이기 때문에, mainLabel.text에 접근할 수 없음(스토리보드의 ui가 없기 때문에 mainLabel에 접근이 안됨)
        // 보통 데이터를 전달할 땐, 클래스/구조체를 전달하는 방법이 많음
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil) // present 라는 함수로 firstVC로 던져준다
        // 기본적으로는 modal 스타일로 view를 보여준다.
        
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {

        
        
        
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        

        
        
        
        
    }
    

    
}

