//
//  UnderLineTextField.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/12.
//

import UIKit

class UnderLineTextField: UITextField {
    
    let underLineView = UIView()

    // placeHolder 컬러값
    lazy var placeholderColor: UIColor = self.tintColor
    lazy var placehodlerString: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        underLineView.backgroundColor = .SSGray2
        self.addSubview(underLineView)
        underLineView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        self.addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        self.addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceholder(placeholder: String, color: UIColor) {
        placehodlerString = placeholder
        placeholderColor = color
        
        setPlaceholder()
        underLineView.backgroundColor = placeholderColor
    }
    
    func setPlaceholder() {
        self.attributedPlaceholder = .attributeFontStyle(font: .SSSemiBold, size: 15, text: placehodlerString, lineHeight: 22)
    }
    
    @objc func editingDidBegin() {
        setPlaceholder()
        underLineView.backgroundColor = self.tintColor
    }
    
    @objc func editingDidEnd() {
        underLineView.backgroundColor = placeholderColor
    }
    
}
