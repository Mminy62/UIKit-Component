//
//  SecondViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    
    // 스토리보드가 메모리에 올라가고 -> 코드 올라가고 -> 둘이 연결된 후 가장 먼저 불리는 함수가 viewDidLoad
    // 그러므로, 아직 연결이 되지 않은 상태에서 viewController에서 mainLabel에 접근해서 문제가 되는 것임
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}






