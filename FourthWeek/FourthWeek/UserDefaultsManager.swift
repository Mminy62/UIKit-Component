//
//  UserDefaultsManager.swift
//  FourthWeek
//
//  Created by 이민영 on 1/16/25.
//

import Foundation

class UserDefaultsManager {
    // 외부에서 UserDefatulsManager 공간을 만들지 않고 하나의 공간만 사용하겠다는 것
    static let shared = UserDefaultsManager() // 하나의 공간만 사용한다 해서 -> 싱글톤 패턴
    private init () { // 외부에서 생성 못하도록 막는 것
        
    }
    
    var age: Int {
        get {
            UserDefaults.standard.integer(forKey: "age")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "age")
        }
    }
    
    var nickname: String {
        get {
            UserDefaults.standard.string(forKey: "name") ?? "대장"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
}
