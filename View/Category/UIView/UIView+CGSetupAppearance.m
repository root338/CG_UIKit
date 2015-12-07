//
//  UIView+CGSetupBorder.m
//  QuickAskCommunity
//
//  Created by DY on 15/10/26.
//  Copyright © 2015年 ym. All rights reserved.
//

#import "UIView+CGSetupAppearance.h"

@implementation UIView (CGSetupBorder)

- (void)cg_setupBorderWithCornerRadius:(CGFloat)cornerRadius
{
    if (cornerRadius > 0) {
        
        if (cornerRadius == self.layer.cornerRadius) {
            return;
        }
        
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = YES;
    }
}

- (void)cg_setupBorderWithWidth:(CGFloat)borderWidth color:(UIColor *)borderColor
{

    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (void)cg_setupBorderWithWidth:(CGFloat)borderWidth color:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius
{
    [self cg_setupBorderWithCornerRadius:cornerRadius];
    [self cg_setupBorderWithWidth:borderWidth color:borderColor];
}

@end