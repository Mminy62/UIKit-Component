//
//  ViewController.swift
//  ProtocolProject
//
//  Created by 이민영 on 1/9/25.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
    let restaurantArray = RestaurantList().restaurantArray
    var annotations: [MKAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {

        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "전체", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "한식", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "양식", at: 2, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        configureMapView()
    }
    
    private func configureMapView() {
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 800, longitudinalMeters: 800)
        segementedControlTapped(segmentedControl)
    }
    
    private func configureAnnotation(item: Restaurant) -> MKAnnotation {
        let pos = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
        let annotation = MKPointAnnotation()
        annotation.title = item.name
        annotation.coordinate = pos
        return annotation
    }
    
    @IBAction func segementedControlTapped(_ sender: UISegmentedControl) {
        // 1. 핀들 제거
        mapView.removeAnnotations(annotations)
        
        // 2. 아이템 추가
        var placeList = restaurantArray
        switch sender.selectedSegmentIndex {
        case 0: // 전체
            // 위치 빼기
            placeList = restaurantArray
        case 1: // 한식
            placeList = restaurantArray.filter { $0.category == "한식" }
        case 2: // 양식
            placeList = restaurantArray.filter { $0.category == "양식" }
        default:
            return
        }
        
        // 3. mapView에 핀 추가
        annotations = placeList.map { configureAnnotation(item: $0) }
        mapView.addAnnotations(annotations)
    }
    
    
}

