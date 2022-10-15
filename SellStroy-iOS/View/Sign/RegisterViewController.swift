//
//  RegisterViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/15.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "추가 정보 입력"
        
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "back_ic")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(selectBackButton))
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        setUpView()
    }
    
    @objc func selectBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectTermsButton(_ sender: UIButton) {
        sender.isSelected = sender.isSelected ? false : true
    }
    
    @objc func selectCompleteButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setUpView() {
        let nickNameLabel = UILabel()
        nickNameLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 15, text: "닉네임", lineHeight: 22)
        self.view.addSubview(nickNameLabel)
        nickNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(50)
            make.left.right.equalToSuperview().inset(24)
        }
        
        let nickeNameTextField = TextField()
        nickeNameTextField.setPlaceholder("닉네임을 입력해주세요")
        self.view.addSubview(nickeNameTextField)
        nickeNameTextField.snp.makeConstraints { make in
            make.top.equalTo(nickNameLabel.snp.bottom).inset(-7)
            make.left.right.equalToSuperview().inset(24)
        }
        
        let termsView = UIView()
        self.view.addSubview(termsView)
        
        let infoPolicyCheckBoxButton = CheckBoxButton()
        termsView.addSubview(infoPolicyCheckBoxButton)
        infoPolicyCheckBoxButton.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.height.equalTo(16)
        }
        infoPolicyCheckBoxButton.addTarget(self, action: #selector(selectTermsButton), for: .touchUpInside)
        
        let infoPolicyLabel = UILabel()
        infoPolicyLabel.attributedText = .attributeFontStyle(font: .SSMedium, size: 15, text: "개인정보처리방침 에 동의합니다. (필수)", lineHeight: 18)
        termsView.addSubview(infoPolicyLabel)
        infoPolicyLabel.snp.makeConstraints { make in
            make.left.equalTo(infoPolicyCheckBoxButton.snp.right).inset(-10)
            make.top.equalTo(infoPolicyCheckBoxButton.snp.top)
        }
        
        let termsCheckBoxButton = CheckBoxButton()
        termsView.addSubview(termsCheckBoxButton)
        termsCheckBoxButton.snp.makeConstraints { make in
            make.top.equalTo(infoPolicyCheckBoxButton.snp.bottom).inset(-19)
            make.left.equalToSuperview()
            make.width.height.equalTo(16)
        }
        termsCheckBoxButton.addTarget(self, action: #selector(selectTermsButton), for: .touchUpInside)
        
        let termsLabel = UILabel()
        termsLabel.attributedText = .attributeFontStyle(font: .SSMedium, size: 15, text: "이용약관 에 동의합니다. (필수)", lineHeight: 18)
        termsView.addSubview(termsLabel)
        termsLabel.snp.makeConstraints { make in
            make.left.equalTo(termsCheckBoxButton.snp.right).inset(-10)
            make.top.equalTo(termsCheckBoxButton.snp.top)
        }
        
        termsView.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(109.adjustWidth)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(termsCheckBoxButton.snp.bottom)
        }
        
        let completeButton = MainButton()
        completeButton.setTitle(title: "완료")
        self.view.addSubview(completeButton)
        completeButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(17)
        }
        completeButton.addTarget(self, action: #selector(selectCompleteButton), for: .touchUpInside)
    }
}
