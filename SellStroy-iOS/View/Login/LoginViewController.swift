//
//  LoginViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/02.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo_big")
        self.view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(204.adjustWidth)
        }
        
        let description = UILabel()
        description.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 14, text: "경험을 사는 커뮤니티", lineHeight: 24)
        self.view.addSubview(description)
        description.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).inset(-13)
            make.centerX.equalToSuperview()
        }
        
        let testButton = MainButton()
        testButton.setTitle(title: "테스트")
        testButton.setTitleColor(.white, for: .normal)
        self.view.addSubview(testButton)
        testButton.snp.makeConstraints { make in
            make.top.equalTo(description.snp.bottom).inset(-146.adjustWidth)
            make.left.right.equalToSuperview().inset(33)
        }
        testButton.addTarget(self, action: #selector(selectTestButton), for: .touchUpInside)
    }
    
    @objc func selectTestButton() {
        self.dismiss(animated: true) {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            guard let rootviewController = appdelegate.window?.rootViewController as? MainViewController else { return }
            rootviewController.presentHomeViewController()
        }
    }
}
