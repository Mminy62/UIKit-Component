//
//  FirstScreen.swift
//  NavigationStack
//
//  Created by 이민영 on 5/12/24.
//

import UIKit

class FirstScreen: UIViewController {
    
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        // title font -> large
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupButton() {
        view.addSubview(nextButton)
        // configuration: determined how it looks
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.configuration?.title = "Next"
        
        // for: normal tab action
        // addTarget: set up action
        nextButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        // standard => view centerX
        
        // NSLayoutContraint 방법
        // view constraint
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // NSLayoutAnchor 방법
        //        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func goToNextScreen() {
        let nextScreen = SecondScreen()
        nextScreen.title = "Second Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }

}

