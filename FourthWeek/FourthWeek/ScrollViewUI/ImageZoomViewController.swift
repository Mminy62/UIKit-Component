//
//  ImageZoomViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/17/25.
//

import UIKit
import SnapKit

class ImageZoomViewController: UIViewController {
    private lazy var scrollView = {
        let view = UIScrollView()
        view.backgroundColor = .green
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.minimumZoomScale = 1 // 너무 작아지지 않도록 보통 1로 설정
        view.maximumZoomScale = 5
        view.bouncesHorizontally = false
        view.delegate = self
        return view
    }()
    private let imageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .yellow
        view.image = UIImage(systemName: "star")
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        // 사용자의 interact는 버튼이 되고 이미지는 안됨 -> isUserInteractionEnabled = true로 바꿔줘야 제스처 체크 가능
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        
        scrollView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(scrollView) // imageView의 크기(size)를 스크롤뷰를 기준으로 작성
            // edge를 기준으로 하지 않는 이유는, 사진을 확대, 축소 했을 때의 leading, top이 달라질 수 있기 때문에 그거에 맞추지 않을 것
        }
        
        // TapGesture // 더블클릭하면 확대되도록
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }
    
    // 1) 배율이 1배 > 2배로 바꾸는 것을 설정해줘야함
    
    @objc func doubleTapGesture() {
        if scrollView.zoomScale == 1 {
            scrollView.setZoomScale(3, animated: true)
        } else { // 이미 확대된 상태라면 원래 모양대로 돌아오는 것
            scrollView.setZoomScale(1, animated: true)
        }
    }
}

extension ImageZoomViewController: UIScrollViewDelegate {
    // pinch gesture
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
