//
//  NavigationAppearance.swift
//  NaverShopping
//
//  Created by 이민영 on 1/16/25.
//

import UIKit

class NavigationAppearance {
    static let shared = NavigationAppearance()
    
    let navBar = UINavigationBarAppearance()
    
    private init () { }
    
    var textAttribute: UINavigationBarAppearance {
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        return navBar
    }
}
