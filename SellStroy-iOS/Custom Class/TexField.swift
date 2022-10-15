//
//  TexField.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/15.
//

import UIKit

class TextField: UITextField {
    
    let padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.SSGray2.cgColor
        self.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setPlaceholder(_ placeholder: String) {
        self.attributedPlaceholder = .attributeFontStyle(font: .SSMedium, size: 18, text: placeholder, lineHeight: 18)
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

