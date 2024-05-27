//
//  LoginViewController.swift
//  VideoStreamingApp
//
//  Created by 이민영 on 5/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    // outlet 화면에 연결
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.layer.cornerRadius = 19
        self.loginButton.layer.borderColor = UIColor(named: "main-brown")?.cgColor
        self.loginButton.layer.borderWidth = 1
    }
    
    
    @IBAction func buttonDidTap(_ sender: Any) {
    }
}

