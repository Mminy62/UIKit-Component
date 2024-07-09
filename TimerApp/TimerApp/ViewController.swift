//
//  ViewController.swift
//  TimerApp
//
//  Created by 이민영 on 6/19/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    private var timer: Timer?
    var number = 0
    
    let systemSoundID: SystemSoundID = 1013
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        // 슬라이더의 가운데 설정
//        slider.minimumValue = 0.0
//        slider.maximumValue = 60.0
//        slider.value = 30.0
        
    }


    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 벨류 값을 가지고 메인 레이블에 텍스트 세팅
        number = Int(slider.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초마다 타이머 실행
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            // closure 시작점에 self를 붙이면, 클로저 내부 속성들에 Self를 안붙여도 된다.
            // 여기서의 self - strong self 인 것
            
            if number > 0 {
                number -= 1
                // 슬라이더도 줄여야됨
                // value 는  0~1사이의 값만 들어감
                slider.value = Float(number) / Float(60)
                mainLabel.text = "\(number) 초"
                
            } else {
                AudioServicesPlaySystemSound(systemSoundID)
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate() // stop timer 기능인, timer를 비활성화 해주는 것을 사용해야한다.
            }
            
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        timer?.invalidate()
        number = 0
    }
}

