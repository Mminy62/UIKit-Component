//
//  ViewController.swift
//  FirstApp
//
//  Created by 이민영 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    // 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.backgroundColor = UIColor.yellow
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        mainLabel.text = "안녕하세요"
        mainLabel.textAlignment = NSTextAlignment.right
        imageView.image = #imageLiteral(resourceName: "Vector")
        
        myButton.backgroundColor = UIColor.blue
        myButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
    }
}

