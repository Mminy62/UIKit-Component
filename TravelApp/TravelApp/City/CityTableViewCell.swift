//
//  CityTableViewCell.swift
//  TravelApp
//
//  Created by 이민영 on 1/6/25.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var countryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.roundCorners(corners: [.topLeft, .bottomRight], radius: 10) // awakeFromNib에서 하면 오른쪽이 짤려서 나옴. layout이 다 안잡힌 상태에서 해서 그런건지..?
    }
    
    func configureData(row: City) {
        countryLabel.text = " \(row.city_name) | \(row.city_english_name)  "
        descriptionLabel.text = "\(  row.city_explain)"
        let url = URL(string: row.city_image)
        countryImageView.kf.setImage(with: url)
    }
    
    private func configure() {
        countryImageView.contentMode = .scaleAspectFill
        countryLabel.textColor = .white
        countryLabel.font = UIFont.systemFont(ofSize: 24.0, weight: .heavy)
        countryLabel.textAlignment = .right
        
        descriptionLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0)
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
