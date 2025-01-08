//
//  BrownViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/7/25.
//

import UIKit

class BrownViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    // 1. Pass Data - 데이터를 받을 공간(프로퍼티 생성), 다이렉트로 testLabel 에 못넣으니까 임의로 배열을 만드는 것
    var contents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "고래밥"
        testLabel.text = contents
    }
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        // present(vc, animated: true) 로 보여준 모달 형태로 들어왔으면, dismiss만 먹고 pop은 먹지않음
    }
    
}
