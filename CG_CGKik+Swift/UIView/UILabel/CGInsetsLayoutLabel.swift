//
//  CGInsetsLayoutLabel.swift
//  QuickAskCommunity
//
//  Created by PCG on 2017/7/4.
//  Copyright © 2017年 ym. All rights reserved.
//

import UIKit

class CGInsetsLayoutLabel: UILabel {

    var verticalSpace : CGFloat?
    var horizontalSpace : CGFloat?
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        if verticalSpace != nil {
            contentSize.height += verticalSpace!
        }
        if horizontalSpace != nil {
            contentSize.width += horizontalSpace!
        }
        return contentSize
    }
    
    
}
