//
//  ViewController.swift
//  TimerApp
//
//  Created by 이민영 on 6/19/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
    }


    @IBAction func sliderChanged(_ sender: UISlider) {
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
}

