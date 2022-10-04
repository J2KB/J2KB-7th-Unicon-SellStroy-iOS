//
//  HomeTabBarController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/02.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .black
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let hallOfFameViewController = UINavigationController(rootViewController: HallOfFameViewController())
        let requestExperienceViewController = UINavigationController(rootViewController: RequestExperienceViewController())
        let myPageViewController = UINavigationController(rootViewController: MyPageViewController())
        
        setViewControllers([homeViewController, searchViewController, hallOfFameViewController, requestExperienceViewController, myPageViewController], animated: true)
        
        let homeTabbarItem = UITabBarItem(title: "홈", image: UIImage(named: "home_ic"), selectedImage:  UIImage(named: "home_select_ic"))
        homeViewController.tabBarItem = homeTabbarItem
        
        let searchTabbarItem = UITabBarItem(title: "검색", image: UIImage(named: "search_ic"), selectedImage: UIImage(named: "search_select_ic"))
        searchViewController.tabBarItem = searchTabbarItem
        
        let hallOfFameTabbarItem = UITabBarItem(title: "명예의전당", image: UIImage(named: "hallOfFame_ic"), selectedImage: UIImage(named: "hallOfFame_select_ic"))
        hallOfFameViewController.tabBarItem = hallOfFameTabbarItem
        
        let requestExTabbarItem = UITabBarItem(title: "경험요청", image: UIImage(named: "questionEx_ic"), selectedImage: UIImage(named: "questionEx_select_ic"))
        requestExperienceViewController.tabBarItem = requestExTabbarItem
        
        let myPageTabbarItem = UITabBarItem(title: "마이페이지", image: UIImage(named: "myPage_ic"), selectedImage: UIImage(named: "myPage_select_ic"))
        myPageViewController.tabBarItem = myPageTabbarItem
    }
}
