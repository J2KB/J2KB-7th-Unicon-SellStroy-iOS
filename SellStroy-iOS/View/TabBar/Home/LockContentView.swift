//
//  LockContentView.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/06.
//

import UIKit

class LockContentView: UIView {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
        
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "lock_bg_image")
        self.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let infoView = UIView()
        infoView.frame = .init(x: 0, y: 0, width: 251.adjustWidth, height: 170.adjustWidth)
        infoView.clipsToBounds = true
        infoView.layer.cornerRadius = 5
        infoView.backgroundColor = .white
        infoView.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        infoView.layer.shadowOpacity = 1
        infoView.layer.shadowRadius = 15
        infoView.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(251.adjustWidth)
            make.height.equalTo(170.adjustWidth)
        }
        
        let lockImageView = UIImageView()
        lockImageView.image = UIImage(named: "lock_ic")
        infoView.addSubview(lockImageView)
        lockImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(25)
        }
        
        let infoLabel = UILabel()
        infoLabel.numberOfLines = 2
        infoLabel.attributedText = .attributeFontStyle(font: .SSBold, size: 15, text: "전체 내용을 보고 싶다면?\n지금 바로 구매하세요!", lineHeight: 21)
        infoView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(lockImageView.snp.bottom).inset(-17)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
