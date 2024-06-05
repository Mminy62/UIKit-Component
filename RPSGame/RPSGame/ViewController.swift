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
    
    var myChoice: RPS = RPS.rock
    var comChoice: RPS = RPS(rawValue: Int.random(in: 0...2))! // rawvalue에 범위 밖의 값이 들어갈까봐 optional 처리됨
    
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
        // sender로 각 버튼을 구별해야함
        // 버튼의 문자를 가져옴
        if let title = sender.currentTitle {
            switch title {
            case "가위":
                // 가위 열거형을 만들어서 출력
                myChoice = RPS.scissors
            case "바위":
                myChoice = RPS.rock
            case "보":
                myChoice = RPS.paper
            default:
                break
            }
            return
        }
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 내가 선택한 것과 컴퓨터가 선택한 것을 같이 표시
        // 이겼는지 졌는지 판단 -> 표시
        
        switch comChoice {
        case RPS.rock:
            comImageView.image = UIImage(named: "rock.png")
            comChoiceLabel.text = "바위"
        case RPS.paper:
            comImageView.image = UIImage(named: "paper.png")
            comChoiceLabel.text = "보"
        case RPS.scissors:
            comImageView.image = UIImage(named: "scissors.png")
            comChoiceLabel.text="가위"
        }
        
        switch myChoice {
        case RPS.rock:
            myImageView.image = UIImage(named: "rock.png")
            myChoiceLabel.text = "바위"
        case RPS.paper:
            myImageView.image = UIImage(named: "paper.png")
            myChoiceLabel.text = "보"
        case RPS.scissors:
            myImageView.image = UIImage(named: "scissors.png")
            myChoiceLabel.text="가위"
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 첫번째/두번째 이미지뷰에 준비 이미지를 띄워야함
        // 2) 첫번째/두번재 레이블에 "준비"라고 문자열을 띄워야함
    }
    
    
    
    
    
    
}
