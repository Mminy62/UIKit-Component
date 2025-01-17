//
//  VerticalScrollViewController.swift
//  FourthWeek
//
//  Created by 이민영 on 1/17/25.
//

import UIKit
import SnapKit
class VerticalScrollViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    let imageView = UIImageView()
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        configureLayout()
        configureContentView()
    }
    func configureLayout() {
        scrollView.backgroundColor = .lightGray
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        // scrollView의 레이아웃을 설정한 후에 contentView를 설정해야한다
        contentView.backgroundColor = .red
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.verticalEdges.equalTo(scrollView) // 스크롤뷰를 기준으로 vertical?.. 왜?.. 내리는 기준으로 보려고?
            // scrollView 가 안보이지만, 엄청 긴 화면으로 있는 상태이기 때문에
//            make.edges.equalTo(scrollView) // 가로 세로 스크롤 가능해질때 의미 있음(지금은 수직 스크롤 일때는, 아이템의 가로를 설정하지 않았기에 작게 나온다.)
            // 그럼 수직 스크롤할 때 모든 아이템의 width를 잡아두면 되지 않나..? =>
            // 스크롤 뷰의 아이템이니까... contentView.inset으로 두는게 더 맞긴해
            
            // 수평 스크롤
            
            // 엄청 긴 view를 하나 만들어놓고, 거기에 뷰객체를 만들어둔거같음
        }
    }
    
    func configureContentView() {
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        contentView.addSubview(button)
        
        label.backgroundColor = .orange
        imageView.backgroundColor = .black
        button.backgroundColor = .purple
        label.text = "Dfasdfadfsf"
        label.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(900)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(200)
        }
        
        // 버튼이 유동적으로 달라질 수 있는 것 때문에 밑에 뒀지만, 레이아웃 설정 함수에서의 순서의 영향은 없음
        button.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.top.equalTo(label.snp.bottom).offset(50)
            make.bottom.equalTo(imageView.snp.top).offset(-50)
        }
    }
    
}
