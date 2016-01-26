//
//  UIImage+CGLoadImage.h
//  QuickAskCommunity
//
//  Created by DY on 16/1/22.
//  Copyright © 2016年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIImage (CGLoadImage)

+ (nullable UIImage *)cg_loadPNGImageName:(NSString *)imageName;

+ (nullable UIImage *)cg_loadImageName:(NSString *)imageName withExtension:(NSString *)ext;

@end
NS_ASSUME_NONNULL_END