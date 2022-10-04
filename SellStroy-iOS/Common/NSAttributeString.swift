//
//  NSAttributeString.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/04.
//

import UIKit

enum FontStyle {
    case SSBold
    case SSSemiBold
    case SSMedium
    case SSRegular
}

extension NSAttributedString {
    class func attributeFontStyle(font: FontStyle, size: CGFloat, text: String, lineHeight: CGFloat) -> NSAttributedString {
        
        let attrString = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        
        if #available(iOS 14.0, *) {
            paragraphStyle.lineBreakStrategy = .hangulWordPriority
        } else {
            paragraphStyle.lineBreakStrategy = .pushOut
        }
        
        var setFont = UIFont()
        switch font {
        case .SSBold:
            setFont = UIFont(name: "Pretendard-Bold", size: size.adjustWidth)!
        case .SSSemiBold:
            setFont = UIFont(name: "Pretendard-SemiBold", size: size.adjustWidth)!
        case .SSMedium:
            setFont = UIFont(name: "Pretendard-Medium", size: size.adjustWidth)!
        case .SSRegular:
            setFont = UIFont(name: "Pretendard-Regular", size: size.adjustWidth)!
        }
        
        paragraphStyle.lineSpacing = lineHeight - setFont.lineHeight
        
        attrString.addAttributes([
                    NSAttributedString.Key.paragraphStyle : paragraphStyle,
                    .font : setFont,
                ], range: NSMakeRange(0, attrString.length))
        
        return attrString
    }
}
