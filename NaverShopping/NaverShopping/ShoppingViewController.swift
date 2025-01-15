//
//  ShoppingViewController.swift
//  NaverShopping
//
//  Created by 이민영 on 1/15/25.
//

import UIKit

class ShoppingViewController: UIViewController {

    let searchItem: String
    
    init(searchItem: String) {
        self.searchItem = searchItem
        print(searchItem)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
    }
    
    
}
