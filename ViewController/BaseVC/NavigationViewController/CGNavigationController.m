//
//  CGNavigationController.m
//  TestCG_CGKit
//
//  Created by DY on 16/1/27.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGNavigationController.h"

#import "CGNavigationDelegateObject.h"

#import "UINavigationController+CGSetupGestureRecognizer.h"

@interface CGNavigationController ()

@property (nonatomic, strong) CGNavigationDelegateObject *delegateObject;
@end

@implementation CGNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self cg_openFullScreenPopGestureRecognizer];
    
    self.delegateObject = [[CGNavigationDelegateObject alloc] init];
    self.delegate   = self.delegateObject;
    
    self.defaultNavigationBarBackgroundColor    = self.navigationBar.barTintColor ? self.navigationBar.barTintColor : [UIColor whiteColor];
}

#pragma mark - 设置导航栏
- (UIStatusBarStyle)preferredStatusBarStyle
{
    UIStatusBarStyle statusBarStyle = self.defaultStatusBarStyle;
    if ([self.topViewController respondsToSelector:@selector(preferredStatusBarStyle)]) {
        statusBarStyle  = [self.topViewController preferredStatusBarStyle];
    }
    return statusBarStyle;
}

- (BOOL)prefersStatusBarHidden
{
    BOOL statusBarHidden    = self.defaultStatusBarHidden;
    if ([self.topViewController respondsToSelector:@selector(prefersStatusBarHidden)]) {
        statusBarHidden = [self.topViewController prefersStatusBarHidden];
    }
    return statusBarHidden;
}

#pragma mark - 设置属性

@end
