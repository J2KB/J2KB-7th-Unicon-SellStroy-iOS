//
//  TextView.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/13.
//

import UIKit

class TextView: UITextView {
    
    let placeHolderLabel = UILabel()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlaceHolder(placeholder: String) {
        placeHolderLabel.attributedText = .attributeFontStyle(font: .SSSemiBold, size: 12, text: placeholder, lineHeight: 22)
        placeHolderLabel.textColor = .SSGray2
        self.addSubview(placeHolderLabel)
        placeHolderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(7)
            make.left.right.equalToSuperview()
        }
    }
}

extension TextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("in")
        placeHolderLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
        } else {
            placeHolderLabel.isHidden = true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size: CGSize = .init(width: self.frame.height, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { constraint in
            if estimatedSize.height <= 354 {
                
            } else {
                if constraint.firstAttribute == .height {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
}
