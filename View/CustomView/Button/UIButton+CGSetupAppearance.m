//
//  UIButton+SetupAppearance.m
//  QuickAskCommunity
//
//  Created by DY on 15/10/30.
//  Copyright © 2015年 ym. All rights reserved.
//

#import "UIButton+CGSetupAppearance.h"
#import "UIView+CGSetupAppearance.h"

@implementation UIButton (CGSetupAppearance)

- (void)cg_setupWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self.titleLabel setFont:font];
}

- (void)cg_setupWithNormalImageName:(NSString *)normalImageName selectImageName:(NSString *)selectImageName
{
    UIImage *normalImage = [self loadLocalImageName:normalImageName];
    !normalImage ?: [self setImage:normalImage forState:UIControlStateNormal];
    
    UIImage *selectImage = [self loadLocalImageName:selectImageName];
    !selectImage ?: [self setImage:selectImage forState:UIControlStateNormal];
}

- (void)cg_setupWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font radius:(CGFloat)radius
{
    [self cg_setupWithTitle:title titleColor:titleColor font:font];
    [self cg_setupBorderWithCornerRadius:radius];
}

- (void)cg_setupWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor radius:(CGFloat)radius
{
    [self cg_setupWithTitle:title titleColor:titleColor font:font];
    [self cg_setupBorderWithWidth:borderWidth color:borderColor cornerRadius:radius];
}

- (UIImage *)loadLocalImageName:(NSString *)imageName
{
    UIImage *image = nil;
    if (imageName) {
        image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    return image;
}
@end