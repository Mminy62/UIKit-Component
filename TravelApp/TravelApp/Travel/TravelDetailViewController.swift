//
//  TravelDetailViewController.swift
//  TravelApp
//
//  Created by 이민영 on 1/7/25.
//

import UIKit
import Kingfisher

class TravelDetailViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var content: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 화면"
        configureUI()
        configureData()
    }
    private func configureData() {
        guard let content else { return }
        if let url = content.travel_image {
            mainImageView.kf.setImage(with: URL(string: url))
        }
        
        titleLabel.text = content.title
        subTitleLabel.text = content.description
    }
    
    private func configureUI() {
        mainImageView.layer.cornerRadius = 10
        mainImageView.contentMode = .scaleAspectFill

        titleLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        subTitleLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        subTitleLabel.textColor = .black
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textAlignment = .center
        
        backButton.backgroundColor = .blue
        backButton.layer.cornerRadius = backButton.frame.height / 2
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.textAlignment = .center
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        backButton.setTitle("다른 관광지 보러 가기", for: .normal)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
