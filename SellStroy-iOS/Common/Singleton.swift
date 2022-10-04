//
//  Singleton.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/05.
//

import UIKit

class Singleton {
    static let shared = Singleton()
    private init() { }
    
    let statusBar =  UIView()
    
    func changeStatusBarColor(backgroundColor: UIColor) {
        statusBar.frame = UIApplication.shared.statusBarFrame
        statusBar.backgroundColor = backgroundColor
        UIApplication.shared.keyWindow?.addSubview(statusBar)
    }
}
