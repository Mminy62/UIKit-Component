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
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil) // present 라는 함수로 firstVC로 던져준다, 기본적으로 modal 타입
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        // 메모리에 secondViewController가 힙 영역에 이미 있음(storyboard)
        // UIViewController 안에 storyboard가 선언되어 있음
        // storyboard에 있는 식별자를 기준으로 연결해줘야함
        
        // 타입캐스팅이 필요
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        secondVC.someString = "아빠상어"
        present(secondVC, animated: true, completion: nil)
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        // 버튼 눌릴 때, 실행
        performSegue(withIdentifier: "toThirdVC", sender: self) // sender: 보내는 화면
    }
    
    // 세그웨이로 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. id 확인
        // 2. destination에 접근해서 타입 캐스팅
        // 3. 데이터 전달
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "엄마상어"
            
        }
        
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "네번째화면"
            
        }
    }
    
    // 4) 직접 세그웨이
    // 버튼에 직접적으로 seuge를 연결했을때만 실행 가능
    // 버튼에 직접 segue를 연결, 내부적으론 performSegue로 실행
    // 조건문에 따라 실행하도록, shouldPerfomSegue 함수 실행
    var num = 7
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if num > 5 {
            return false
        } else {
            return true // 다음화면으로 넘어가는 것
        }
        
    }
    

    
}

