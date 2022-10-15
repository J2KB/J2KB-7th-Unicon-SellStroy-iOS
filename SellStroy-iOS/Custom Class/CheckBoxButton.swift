//
//  CheckBoxButton.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/15.
//

import UIKit

class CheckBoxButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.setImage(UIImage(named: "check_ic"), for: .normal)
                self.backgroundColor = .SSRed
                self.layer.borderWidth = 0
            } else {
                self.setImage(UIImage(), for: .normal)
                self.backgroundColor = .white
                self.layer.borderWidth = 1
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.frame = .init(x: 0, y: 0, width: 16, height: 16)
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.SSGray2.cgColor
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
