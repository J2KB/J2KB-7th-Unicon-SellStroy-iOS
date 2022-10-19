//
//  MyPageViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/02.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let leftBarButton = UIBarButtonItem(title: "마이페이지", style: .plain, target: self, action: nil)
        leftBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Singleton.shared.changeStatusBarColor(backgroundColor: .white)
    }
    
    func setUpView() {
        let userInfoView = UIView()
        userInfoView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 144)
        userInfoView.backgroundColor = .SSGray1
        self.view.addSubview(userInfoView)
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalTo(144)
        }
        
        let userNicknameLabel = UILabel()
        userNicknameLabel.attributedText = .attributeFontStyle(font: .SSBold, size: 20, text: "소소한일상", lineHeight: 24)
        userInfoView.addSubview(userNicknameLabel)
        userNicknameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(23)
            make.left.equalToSuperview().inset(24)
        }
        
        let pointView = UIView()
        pointView.frame = .init(x: 0, y: 0, width: 80, height: 48)
        userInfoView.addSubview(pointView)
        
        let pointTitle = UILabel()
        pointTitle.attributedText = .attributeFontStyle(font: .SSBold, size: 12, text: "포인트", lineHeight: 24)
        pointTitle.textColor = .SSGray3
        pointView.addSubview(pointTitle)
        pointTitle.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        let point = UILabel()
        point.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "10,000", lineHeight: 24)
        pointView.addSubview(point)
        point.snp.makeConstraints { make in
            make.top.equalTo(pointTitle.snp.bottom).inset(-5)
            make.left.right.equalToSuperview()
        }
        
        pointView.snp.makeConstraints { make in
            make.top.equalTo(pointTitle.snp.top)
            make.bottom.equalTo(point.snp.bottom)
            make.left.equalToSuperview().inset(24)
            make.width.equalTo(80)
            make.top.equalTo(userNicknameLabel.snp.bottom).inset(-20)
        }
        
        let uploadStoryView = UIView()
        uploadStoryView.frame = .init(x: 0, y: 0, width: 80, height: 48)
        userInfoView.addSubview(uploadStoryView)
        
        let uploadStoryTitle = UILabel()
        uploadStoryTitle.attributedText = .attributeFontStyle(font: .SSBold, size: 12, text: "내가 올린 글", lineHeight: 24)
        uploadStoryTitle.textColor = .SSGray3
        uploadStoryView.addSubview(uploadStoryTitle)
        uploadStoryTitle.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        let uploadStory = UILabel()
        uploadStory.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "0", lineHeight: 24)
        uploadStoryView.addSubview(uploadStory)
        uploadStory.snp.makeConstraints { make in
            make.top.equalTo(uploadStoryTitle.snp.bottom).inset(-5)
            make.left.right.equalToSuperview()
        }
        
        uploadStoryView.snp.makeConstraints { make in
            make.top.equalTo(uploadStoryTitle.snp.top)
            make.bottom.equalTo(uploadStory.snp.bottom)
            make.left.equalTo(pointView.snp.right)
            make.width.equalTo(80)
            make.top.equalTo(userNicknameLabel.snp.bottom).inset(-20)
        }

        let payStoryView = UIView()
        payStoryView.frame = .init(x: 0, y: 0, width: 80, height: 48)
        userInfoView.addSubview(payStoryView)
        
        let payStoryTitle = UILabel()
        payStoryTitle.attributedText = .attributeFontStyle(font: .SSBold, size: 12, text: "구매한 글", lineHeight: 24)
        payStoryTitle.textColor = .SSGray3
        payStoryView.addSubview(payStoryTitle)
        payStoryTitle.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        let payStory = UILabel()
        payStory.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "3", lineHeight: 24)
        payStoryView.addSubview(payStory)
        payStory.snp.makeConstraints { make in
            make.top.equalTo(payStoryTitle.snp.bottom).inset(-5)
            make.left.right.equalToSuperview()
        }
        
        payStoryView.snp.makeConstraints { make in
            make.top.equalTo(payStoryTitle.snp.top)
            make.bottom.equalTo(payStory.snp.bottom)
            make.left.equalTo(uploadStoryView.snp.right)
            make.width.equalTo(80)
            make.top.equalTo(userNicknameLabel.snp.bottom).inset(-20)
        }
        
        let logoutButton = UIButton()
        logoutButton.setAttributedTitle(.attributeFontStyle(font: .SSMedium, size: 15, text: "로그아웃", lineHeight: 24), for: .normal)
        self.view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { make in
            make.height.equalTo(54)
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(userInfoView.snp.bottom)
        }
    }
}
