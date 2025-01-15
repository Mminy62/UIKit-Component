//
//  Protocol+View.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import Foundation

protocol ViewConfiguration: AnyObject {
    func configureHierarchy() // addSubView
    func configureLayout() // SnapKit
    func configureView() // property
}
