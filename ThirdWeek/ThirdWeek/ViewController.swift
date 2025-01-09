//
//  ViewController.swift
//  ThirdWeek
//
//  Created by 이민영 on 1/8/25.
//

import UIKit
import MapKit

struct User {
    let name: String
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    let pickerView = UIPickerView()
    let list = ["가", "나", "다"]
    let array = ["a", "b", "c", "d"]
    
    let user: [User] = [
        User(name: "a"),
        User(name: "b")
    ]
    
    let person: [User] = [
        .init(name: "a"),
        .init(name: "b")
    ]
    
    override func viewDidLoad() { // viewDidload의 pickerview 내용은 어디에 쓰지? => viewDidLoad는 한곳에만 사용 가능
        super.viewDidLoad()
        secondTextField.tintColor = .red
        secondTextField.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
    
        userTextField.delegate = self
        mapView.delegate = self
        configureMapView()
    }
}

// MARK: MapView configure 설정
extension ViewController {
    func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        // 핀 찍기
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
    }
}

// MARK: TextField 설정
extension ViewController: UITextFieldDelegate {
    // 키보드에서 엔터키 클릭했을 때
    // did end on exit: 키보드 내리는 기능까지 포함된 함수였음
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userTextField {
            view.endEditing(true) // 화면 내리기
        }
        return true
    }
}

// MARK: PickerView 설정
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    // pickerview도 결국 컬렉션, 테이블 뷰와 비슷하다.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? list.count : array.count
    }
    
    // 컴포넌트 갯수 (열의 개수)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? list[row] : array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let data = component == 0 ? list[row] : array[row]
        secondTextField.text = data
    }
}
