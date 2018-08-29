//
//  UIView+CGViewAnimationExtension.m
//  QuickAskCommunity
//
//  Created by apple on 2018/1/5.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "UIView+CGViewAnimationExtension.h"

#import "UIView+CGSetupFrame.h"

@implementation UIView (CGViewAnimationExtension)

- (void)animateWithStyle:(CGViewAnimationStyle)style type:(CGOperateViewAnimationType)type anchorPoint:(CGPoint)anchorPoint duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^ _Nullable)(void))animations completion:(void (^ _Nullable)(BOOL))completion
{
    CGRect frame            = self.frame;
    CGPoint oldAnchorPoint  = self.layer.anchorPoint;
    /// 先还原一下
    [self _setupTransformIsIdentity];
    
    self.layer.anchorPoint  = anchorPoint;
    self.frame              = frame;
    
    [self _setupWillAnimationWithStyle:style type:type];
    
    [UIView animateWithDuration:duration delay:delay usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:options animations:^{
        
        [self _setupAnimationWithStyle:style type:type];
        if (animations) {
            animations();
        }
    } completion:^(BOOL finished) {

        self.layer.anchorPoint  = oldAnchorPoint;
        self.frame              = frame;
        if (completion) {
            completion(finished);
        }
    }];
}

- (void)animateWithStyle:(CGViewAnimationStyle)style type:(CGOperateViewAnimationType)type anchorPoint:(CGPoint)anchorPoint duration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^ _Nullable)(void))animations completion:(void (^ _Nullable)(BOOL))completion
{
    CGRect frame            = self.frame;
    CGPoint oldAnchorPoint  = self.layer.anchorPoint;
    /// 先还原一下
    [self _setupTransformIsIdentity];
    
    self.layer.anchorPoint  = anchorPoint;
    self.frame              = frame;
    
    [self _setupWillAnimationWithStyle:style type:type];
    
    [UIView animateWithDuration:duration delay:delay options:options animations:^{
        
        [self _setupAnimationWithStyle:style type:type];
        if (animations) {
            animations();
        }
    } completion:^(BOOL finished) {
        
        self.layer.anchorPoint  = oldAnchorPoint;
        self.frame              = frame;
        if (completion) {
            completion(finished);
        }
    }];
}

- (void)_setupWillAnimationWithStyle:(CGViewAnimationStyle)style type:(CGOperateViewAnimationType)type
{
    switch (style) {
        case CGViewAnimationStyleScale:
        {
            if (type == CGOperateViewAnimationTypeShow) {
                [self _setupTransformScaleIsZero];
            }else if (type == CGOperateViewAnimationTypeHide) {
                [self _setupTransformIsIdentity];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)_setupAnimationWithStyle:(CGViewAnimationStyle)style type:(CGOperateViewAnimationType)type
{
    switch (style) {
        case CGViewAnimationStyleScale:
        {
            if (type == CGOperateViewAnimationTypeShow) {
                [self _setupTransformIsIdentity];
            }else if (type == CGOperateViewAnimationTypeHide) {
                [self _setupTransformScaleIsZero];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)_setupTransformScaleIsZero {
    self.transform  = CGAffineTransformMakeScale(0.001, 0.001);
}

- (void)_setupTransformIsIdentity {
    self.transform  = CGAffineTransformIdentity;
}

@end

