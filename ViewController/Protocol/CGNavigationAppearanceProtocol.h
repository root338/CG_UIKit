//
//  CGNavigationAppearanceProtocol.h
//  TestCG_CGKit
//
//  Created by DY on 16/1/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** 设置导航栏外观的协议 */
@protocol CGNavigationAppearanceProtocol <NSObject>

@optional
/** 是否隐藏导航栏 */
- (BOOL)cg_prefersNavigationBarHidden;


@end
