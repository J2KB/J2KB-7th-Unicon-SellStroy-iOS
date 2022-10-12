//
//  GuideView.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/13.
//

import UIKit

class GuideView: UIView {
    
    let guideContent = UILabel()
    let arrowImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 43.adjustWidth)
        self.backgroundColor = .SSGray1
        self.layer.cornerRadius = 5
        self.snp.makeConstraints { make in
            make.height.equalTo(43.adjustWidth)
        }
        
        let guideButton = UIButton()
        self.addSubview(guideButton)
        guideButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        guideButton.addTarget(self, action: #selector(selectGuideButton), for: .touchUpInside)
        
        let guideTitle = UILabel()
        guideTitle.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 13, text: "작성 가이드", lineHeight: 22)
        guideButton.addSubview(guideTitle)
        guideTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(13)
            make.left.equalToSuperview().inset(11)
        }
        
        arrowImageView.image = UIImage(named: "down_arrow_ic")
        guideButton.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.left.equalTo(guideTitle.snp.right).inset(-5)
        }
        
        let guideContentString: String = """
본문 요약 글은 경험을 구매하기 전 나의 경험을 궁금해하도록 유도하는 글입니다! 잘 작성할 수록 내 글을 구매하는 사람이 많아지겠죠?

경험글에는 이런 내용이 들어가면 좋습니다!
- 그 때 당시 상황에 대한 자세한 설명을 써주시면 좋아요!
    ex) 제가 스타트업에 인턴으로 생활을 했을 때 ~
- 상황에 대한 해결 방법을 작성해주세요.
    ex) 의견 충돌이 났을 때 모두의 의견을 수용할 수 있는 방안을 ~
- 정보 공유의 글일 경우 자기가 직접 경험했던 것들만 작성해주세요.
"""
        
        guideContent.isHidden = true
        guideContent.numberOfLines = 0
        guideContent.attributedText = .attributeFontStyle(font: .SSBold, size: 11, text: guideContentString, lineHeight: 20)
        guideContent.textColor = .SSGray4
        guideButton.addSubview(guideContent)
        guideContent.snp.makeConstraints { make in
            make.top.equalTo(guideTitle.snp.bottom).inset(-9)
            make.left.right.equalToSuperview().inset(12)
        }
    }
    
    @objc func selectGuideButton(_ sender: UIButton) {
        sender.isSelected = sender.isSelected ? false : true
        guideContent.isHidden = !sender.isSelected
        arrowImageView.image = UIImage(named: sender.isSelected ? "up_arrow_ic" : "down_arrow_ic")
        self.snp.updateConstraints { make in
            make.height.equalTo(sender.isSelected ? 229.adjustWidth : 43.adjustWidth)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
