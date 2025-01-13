//
//  Travel.swift
//  TravelApp
//
//  Created by 이민영 on 1/3/25.
//

import Foundation

struct Travel {
    let title: String
    let description: String?
    let travel_image: String?
    let grade: Float?
    let save: Int?
    var like: Bool?
    let ad: Bool?
}

//
//class Class {
//    let name: String
//    var count: Int
//    lazy var description: String = "다운로드 중인 설명 글... 초기화까지 좀 걸림"
//    
//    init(name: String, count: Int) {
//        self.name = name
//        self.count = count
//    }
//}
//
//var mathClass = Class(name: "수학", count: 14)
//print(mathClass.description) // 이때 초기화 하는 것
//
//
