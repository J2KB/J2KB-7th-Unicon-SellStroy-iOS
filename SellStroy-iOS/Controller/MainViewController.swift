//
//  ViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/01.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }

    func presentLoginViewController() {
        
    }
    
    func presentHomeViewController() {
        let homeTabBarViewController = HomeTabBarController()
        homeTabBarViewController.modalPresentationStyle = .fullScreen
        self.present(homeTabBarViewController, animated: true, completion: nil)
    }

}

