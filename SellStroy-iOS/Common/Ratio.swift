//
//  Ratio.swift
//  SellStroy-iOS
//
//  Created by minimani on 2022/10/05.
//

import UIKit

let ratioWidth = UIScreen.main.bounds.width / 375
let ratioHeight = UIScreen.main.bounds.height / 512

let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0

extension CGFloat {
    var adjustWidth: CGFloat {
        return self * ratioWidth
    }
    
    var adjustHeight: CGFloat {
        return self * ratioHeight
    }
}

extension Int {
    var adjustWidth: CGFloat {
        return CGFloat(self) * ratioWidth
    }
    
    var adjustHeight: CGFloat {
        return CGFloat(self) * ratioHeight
    }
}
