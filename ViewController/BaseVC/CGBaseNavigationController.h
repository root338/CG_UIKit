//
//  CGBaseNavigationViewController.h
//  QuickAskCommunity
//
//  Created by DY on 15/10/21.
//  Copyright © 2015年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CGBaseNavigationController : UINavigationController
<
    UINavigationControllerDelegate

>

/** 是否隐藏NavigationBar */
@property (assign, nonatomic) BOOL preferredNavigationBarHidden;

/** 显隐NavigationBar时是否执行动画 */
@property (assign, nonatomic) BOOL preferredNavigationBarAnimation
@end
