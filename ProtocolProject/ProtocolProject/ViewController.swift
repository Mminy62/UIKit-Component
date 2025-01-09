//
//  ViewController.swift
//  ProtocolProject
//
//  Created by 이민영 on 1/9/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIActionSheetDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var showButton: UIButton!
    
    let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
    let restaurantArray = RestaurantList().restaurantArray
    var annotations: [MKAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        configureMapView()
        configureButton()
        configureActionSheet()
    }
    
    func updateAnnotations(_ menuName: String) {
        // 1. 핀들 제거
        mapView.removeAnnotations(annotations)
        
        // 2. 아이템 추가
        var placeList = restaurantArray
        switch menuName {
        case Menu.all.name: // 전체
            placeList = restaurantArray
        case Menu.korean.name: // 한식
            placeList = restaurantArray.filter { $0.category == Menu.korean.name }
        case Menu.western.name: // 양식
            placeList = restaurantArray.filter { $0.category == Menu.western.name }
        default:
            return
        }
        
        // 3. mapView에 핀 추가
        annotations = placeList.map { configureAnnotation(item: $0) }
        mapView.addAnnotations(annotations)
    }
}

// MARK: Menu enum
enum Menu: Int {
    case all
    case korean
    case western
    
    var name: String {
        switch self {
        case .all:
            "전체"
        case .korean:
            "한식"
        case .western:
            "양식"
        }
    }
}

// MARK: UI configure 설정
extension ViewController {
    private func configureButton() {
        showButton.setTitle("Show Category", for: .normal)
        showButton.titleLabel?.textColor = .black
        showButton.backgroundColor = .white
        showButton.addTarget(self, action: #selector(configureActionSheet), for: .touchUpInside)
    }
    
    private func configureMapView() {
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 800, longitudinalMeters: 800)
        self.updateAnnotations(Menu.all.name)
    }
    
    private func configureAnnotation(item: Restaurant) -> MKAnnotation {
        let pos = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
        let annotation = MKPointAnnotation()
        annotation.title = item.name
        annotation.coordinate = pos
        return annotation
    }
    
    @objc func configureActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil,
                                            preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: Menu.all.name, style: .default) { (action) in
            self.updateAnnotations(action.title!)
        }
        let secondAction = UIAlertAction(title: Menu.korean.name, style: .default) { (action) in
            self.updateAnnotations(action.title!)
        }
        let thirdAction = UIAlertAction(title: Menu.western.name, style: .default) { (action) in
            self.updateAnnotations(action.title!)
        }

        actionSheet.addAction(firstAction)
        actionSheet.addAction(secondAction)
        actionSheet.addAction(thirdAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}
