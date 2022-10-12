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
        self.view.backgroundColor = .white
    }

    func presentLoginViewController() {
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        loginViewController.modalTransitionStyle = .crossDissolve
        self.present(loginViewController, animated: true)
    }
    
    func presentHomeViewController() {
        let homeTabBarViewController = HomeTabBarController()
        homeTabBarViewController.modalPresentationStyle = .fullScreen
        homeTabBarViewController.modalTransitionStyle = .crossDissolve
        self.present(homeTabBarViewController, animated: true, completion: nil)
    }
}

