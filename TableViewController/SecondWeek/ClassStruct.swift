//
//  ClassStruct.swift
//  SecondWeek
//
//  Created by 이민영 on 1/2/25.
//

import Foundation

// 1. 가지고 있는 프로퍼티를 모두 초기화
// 2. 가지고 있는 프로퍼티를 옵셔널로 선언
// 매번 다른 값으로 선언하고 싶다면 아래와같이
class Monster {
    var clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    let name: String
    
    init(clothes: String, speed: Int, power: Int, experience: Int, name: String) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.experience = experience
        self.name = name
    }
    
    
}

class BossMonster: Monster {
    
}

class SuperMonster: BossMonster {

}


struct MonsterStruct {
    let clothes: String
    let speed: Int
    let power: Int
    let experience: Int
    let name: String
}

