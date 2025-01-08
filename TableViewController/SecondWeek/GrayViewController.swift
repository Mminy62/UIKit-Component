//
//  GrayViewController.swift
//  SecondWeek
//
//  Created by 이민영 on 1/7/25.
//

import UIKit

class GrayViewController: UIViewController {

    @IBOutlet weak var popButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func popButtonTapped(_ sender: UIButton) {
        print(#function)
        // pushViewController로 들어왔기 때문에 원래 들어왔던 곳으로 나가게 해주면 됨
        // 옵셔널 체이닝 구문에서 걸림
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true) // 안먹음 왜냐면, 들어온 방법에 push이기 때문에 그에 맞게 처리해야함 (dismiss는 modal 방법)
    }

}
