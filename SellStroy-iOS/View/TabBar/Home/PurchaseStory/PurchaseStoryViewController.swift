//
//  PurchaseStoryViewController.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/15.
//

import UIKit

class PurchaseStoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "경험 구매하기"
        
        let leftBarItem = UIBarButtonItem(image: UIImage(named: "back_ic")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(selectBackButton))
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        setUpView()
    }
    
    @objc func selectBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func selectPurchaseButton() {
        UserDefaults.standard.set(true, forKey: "purchase")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setUpView() {
        let purchaseLabel = UILabel()
        purchaseLabel.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "구매 경험", lineHeight: 17.9)
        self.view.addSubview(purchaseLabel)
        purchaseLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(37)
            make.left.right.equalToSuperview().inset(19)
        }
        
        let singleStoryView = SingelStoryView()
        singleStoryView.clipsToBounds = false
        singleStoryView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        singleStoryView.layer.shadowOpacity = 1
        singleStoryView.layer.shadowRadius = 15
        singleStoryView.layer.shadowOffset = CGSize(width: 5, height: 4)
        self.view.addSubview(singleStoryView)
        singleStoryView.snp.makeConstraints { make in
            make.top.equalTo(purchaseLabel.snp.bottom).inset(-19)
            make.left.right.equalToSuperview()
        }
        
        let separatorTopView = UIView()
        separatorTopView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)
        separatorTopView.backgroundColor = .SSGray2
        self.view.addSubview(separatorTopView)
        separatorTopView.snp.makeConstraints { make in
            make.top.equalTo(singleStoryView.snp.bottom).inset(-37)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(1)
        }
        
        let usePoinLabel = UILabel()
        usePoinLabel.attributedText = .attributeFontStyle(font: .SSMedium, size: 15, text: "사용 포인트", lineHeight: 17.9)
        self.view.addSubview(usePoinLabel)
        usePoinLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorTopView.snp.bottom).inset(-22)
            make.left.equalToSuperview().inset(15)
        }
        
        let pointImageView = UIImageView(image: UIImage(named: "point_ic"))
        self.view.addSubview(pointImageView)
        pointImageView.snp.makeConstraints { make in
            make.top.equalTo(separatorTopView.snp.bottom).inset(-20)
            make.right.equalToSuperview().inset(15)
            make.width.equalTo(18)
            make.height.equalTo(20)
        }
        
        let usePoint = UILabel()
        usePoint.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "200", lineHeight: 17.9)
        self.view.addSubview(usePoint)
        usePoint.snp.makeConstraints { make in
            make.top.equalTo(separatorTopView.snp.bottom).inset(-21)
            make.right.equalTo(pointImageView.snp.left).inset(-8)
        }
        
        let separatorBottomView = UIView()
        separatorBottomView.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)
        separatorBottomView.backgroundColor = .SSGray2
        self.view.addSubview(separatorBottomView)
        separatorBottomView.snp.makeConstraints { make in
            make.top.equalTo(usePoinLabel.snp.bottom).inset(-19)
            make.left.right.equalToSuperview().inset(15)
            make.height.equalTo(1)
        }
        
        let afterUsePointLabel = UILabel()
        afterUsePointLabel.attributedText = .attributeFontStyle(font: .SSMedium, size: 15, text: "사용 후 내 포인트", lineHeight: 17.9)
        self.view.addSubview(afterUsePointLabel)
        afterUsePointLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorBottomView.snp.bottom).inset(-20)
            make.left.equalToSuperview().inset(15)
        }
        
        let afterPointImageView = UIImageView(image: UIImage(named: "point_ic"))
        self.view.addSubview(afterPointImageView)
        afterPointImageView.snp.makeConstraints { make in
            make.top.equalTo(separatorBottomView.snp.bottom).inset(-20)
            make.right.equalToSuperview().inset(15)
            make.width.equalTo(18)
            make.height.equalTo(20)
        }
        
        let afterUsePoint = UILabel()
        afterUsePoint.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "잔액부족", lineHeight: 17.9)
        self.view.addSubview(afterUsePoint)
        afterUsePoint.snp.makeConstraints { make in
            make.top.equalTo(separatorBottomView.snp.bottom).inset(-21)
            make.right.equalTo(afterPointImageView.snp.left).inset(-8)
        }
        
        let needPointLabel = UILabel()
        needPointLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 13, text: "추가 필요 포인트 100", lineHeight: 15.51)
        needPointLabel.textColor = .SSGray2
        self.view.addSubview(needPointLabel)
        needPointLabel.snp.makeConstraints { make in
            make.top.equalTo(afterUsePointLabel.snp.bottom).inset(-6)
            make.right.equalTo(afterUsePoint.snp.right)
        }
        
        let purchaseButton = MainButton()
        purchaseButton.setTitle(title: "구매하기")
        self.view.addSubview(purchaseButton)
        purchaseButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(8)
        }
        purchaseButton.addTarget(self, action: #selector(selectPurchaseButton), for: .touchUpInside)
    }
}
