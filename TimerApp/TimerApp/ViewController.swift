//
//  ViewController.swift
//  TimerApp
//
//  Created by 이민영 on 6/19/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
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
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
//        while slider.value * 60 > 0 {
//            let seconds = slider.value * 60
//            slider.value = (seconds - 1) / 60
//            
//            print(slider.value)
//            slider.
//        }


    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        
    }
}

