//
//  Protocol.swift
//  CodeBasedUI
//
//  Created by 이민영 on 1/14/25.
//

import Foundation

protocol ViewConfiguration {
    func configureHierarchy() // addSubView
    func configureLayout() // SnapKit
    func configureView() // property
}
