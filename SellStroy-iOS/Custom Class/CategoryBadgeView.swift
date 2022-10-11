//
//  CategoryBadgeView.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/05.
//

import UIKit

class CategoryBadgeView: UIView {
    
    let categoryLabel = UILabel()
    
    var type: CategoryType = .lifeStyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(type: CategoryType) {
        self.init(frame: .zero)
        self.type = type
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func replayType(type: CategoryType) {
        categoryLabel.attributedText = .attributeFontStyle(font: .SSBold, size: 10, text: type.rawValue, lineHeight: 10)
    }
    
    func setUpView() {
        
        self.backgroundColor = .SSRed
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        
        categoryLabel.attributedText = .attributeFontStyle(font: .SSBold, size: 10, text: type.rawValue, lineHeight: 10)
        categoryLabel.textColor = .white
        self.addSubview(categoryLabel)
        categoryLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.left.right.equalToSuperview().inset(8)
        }
        
        self.snp.makeConstraints { make in
            make.left.equalTo(categoryLabel.snp.left).inset(-8)
            make.right.equalTo(categoryLabel.snp.right).inset(-8)
            make.top.equalTo(categoryLabel.snp.top).inset(-4)
            make.bottom.equalTo(categoryLabel.snp.bottom).inset(-4)
        }
    }
}
