//
//  ViewController.swift
//  RPSGame
//
//  Created by 이민영 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 첫번째/두번째 이미지뷰에 준비 이미지를 띄워야함
        // 2) 첫번째/두번재 레이블에 "준비"라고 문자열을 띄워야함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }


    // code -> storyboard로도 연결 가능
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위 바위 보를 선택해서 그 정보를 저장해야됨
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 컴퓨터가 랜덤 선택한 것을 이미지 뷰에 표시
        // 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        // 내가 선택한 것을 이미지 뷰에 표시
        // 내가 선택한 것을 레이블에 표시
        // 1) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지 졌는지 판단 -> 표시
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 첫번째/두번째 이미지뷰에 준비 이미지를 띄워야함
        // 2) 첫번째/두번재 레이블에 "준비"라고 문자열을 띄워야함
    }
    
    
    
    
    
    
}

