//
//  UINavigationController+CGPushViewController.m
//  QuickAskCommunity
//
//  Created by DY on 16/6/15.
//  Copyright © 2016年 ym. All rights reserved.
//

#import "UINavigationController+CGPushViewController.h"

#import <objc/runtime.h>

@implementation UINavigationController (CGPushViewController)

- (void)cg_pushViewController:(UIViewController *)viewController
{
    [self.navigationController pushViewController:viewController animated:!self.defaultPushHideAnimatied];
}

- (void)cg_pushRemoveLastVCWithNewViewController:(UIViewController *)viewController
{
    [self cg_pushRemoveLastVCWithNewViewController:viewController animated:!self.defaultPushHideAnimatied];
}

- (void)cg_pushRemoveLastVCWithNewViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSMutableArray *newViewControllers  = [NSMutableArray arrayWithArray:self.viewControllers];
    [newViewControllers removeLastObject];
    [newViewControllers addObject:viewController];
    [self setViewControllers:newViewControllers animated:animated];
}

- (void)cg_pushViewController:(UIViewController *)viewController removeViewControllers:(NSArray<UIViewController *> *)viewControllers
{
    [self cg_pushViewController:viewController removeViewControllers:viewControllers animated:!self.defaultPushHideAnimatied];
}

- (void)cg_pushViewController:(UIViewController *)viewController removeViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    NSMutableArray *newViewControllers  = [NSMutableArray arrayWithCapacity:MAX(1, self.viewControllers.count - viewControllers.count)];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![viewControllers containsObject:obj]) {
            [newViewControllers addObject:viewControllers];
        }
    }];
    
    [newViewControllers addObject:viewController];
    [self setViewControllers:newViewControllers animated:animated];
}

- (void)cg_pushViewController:(UIViewController *)viewController removeViewControllerClass:(NSArray<Class> *)viewControllerClass
{
    [self cg_pushViewController:viewController removeViewControllerClass:viewControllerClass animated:!self.defaultPushHideAnimatied];
}

- (void)cg_pushViewController:(UIViewController *)viewController removeViewControllerClass:(NSArray<Class> *)viewControllerClass animated:(BOOL)animated
{
    NSMutableArray *newViewControllers  = [NSMutableArray arrayWithCapacity:MAX(1, self.viewControllers.count - viewControllerClass.count)];
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull viewController, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [viewControllerClass enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (![viewController isMemberOfClass:[obj class]]) {
                [newViewControllers addObject:viewController];
            }
        }];
    }];
    [newViewControllers addObject:viewController];
    [self setViewControllers:newViewControllers animated:animated];
}

#pragma mark - 设置属性 

- (void)setDefaultPushHideAnimatied:(BOOL)animatied
{
    objc_setAssociatedObject(self, @selector(defaultPushHideAnimatied), @(animatied), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)defaultPushHideAnimatied
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
@end
