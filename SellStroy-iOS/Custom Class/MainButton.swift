//
//  MainButton.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/06.
//

import UIKit

class MainButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = .SSRed
        self.layer.cornerRadius = 5
        self.snp.makeConstraints { make in
            make.height.equalTo(41)
        }
    }
    
    func setTitle(title: String) {
        self.setAttributedTitle(.attributeFontStyle(font: .SSBold, size: 15, text: title, lineHeight: 24), for: .normal)
    }
}
