//
//  AdDetailViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/7/25.
//

import UIKit

class AdDetailViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    var content: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "광고 화면"
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(leftBarButtonItemTapped))
        navigationController?.navigationBar.tintColor = .black
        configure()
    }
    
    @objc func leftBarButtonItemTapped() {
        dismiss(animated: true)
    }
    
    private func configure() {
        mainLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        mainLabel.textColor = .black
        mainLabel.textAlignment = .center
        mainLabel.text = content?.title
    }
    
}
