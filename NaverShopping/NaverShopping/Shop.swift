//
//  Shop.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import Foundation

struct Shop: Decodable {
    let total: Int
    let items: [Item]
}
struct Item: Decodable {
    let image, mallName, title, lprice: String
}
