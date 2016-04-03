//
//  UIView+CGAddConstraints.h
//  QuickAskCommunity
//
//  Created by DY on 15/11/20.
//  Copyright © 2015年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CGLayoutConstraintsTypeHeader.h"
#import "UIView+CreateAutoLayoutTypeView.h"

NS_ASSUME_NONNULL_BEGIN

#pragma mark - 设置与视图控制器视图的四周约束

@interface UIView (CGViewControllerConstraints)

/** 设置与视图控制器视图的四周约束为 0 */
- (NSArray<NSLayoutConstraint *> *)cg_autoEdgesInsetsZeroToViewController:(UIViewController *)viewController;

/** 设置与视图控制器视图的四周约束 */
- (NSArray<NSLayoutConstraint *> *)cg_autoEdgesToViewController:(UIViewController *)viewController withInsets:(UIEdgeInsets)insets;

/** 设置与视图控制器视图的四周约束，并忽略指定边 */
- (NSArray<NSLayoutConstraint *> *)cg_autoEdgesToViewController:(UIViewController *)viewController withInsets:(UIEdgeInsets)insets exculdingEdge:(CGLayoutEdge)edge;

@end

#pragma mark - 设置与父视图的四周约束
/** 添加与父视图四周的约束 */
@interface UIView (CGSuperviewConstranints)

/** 设置与父视图四周的间距为0 */
- (NSArray<NSLayoutConstraint *> *)cg_autoEdgesInsetsZeroToSuperview;
/** 设置与父视图四周的间距 */
- (NSArray<NSLayoutConstraint *> *)cg_autoEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets)insets;
/** 设置与父视图四周的间距，并忽略哪边边 */
- (NSArray<NSLayoutConstraint *> *)cg_autoEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets)insets excludingEdge:(CGLayoutEdge)edge;

@end

#pragma mark - 设置与父视图的单个约束
/** 添加与父视图相关的单个约束 */
@interface UIView (CGSuperviewConstranint)

/** 设置与父视图之间的约束（两者相同的边值类型） */
- (NSLayoutConstraint *)cg_autoConstrainToSuperviewAttribute:(NSLayoutAttribute)attribute;

/** 设置与父视图之间的约束（两者相同的边值类型，约束类型） */
- (NSLayoutConstraint *)cg_autoConstrainToSuperviewAttribute:(NSLayoutAttribute)attribute relation:(NSLayoutRelation)relation;

/** 设置与父视图之间的约束（两者相同的边值类型，间距） */
- (NSLayoutConstraint *)cg_autoConstrainToSuperviewAttribute:(NSLayoutAttribute)attribute withOffset:(CGFloat)offset;

/** 设置与父视图之间的约束（两者相同的边值类型，约束类型，间距） */
- (NSLayoutConstraint *)cg_autoConstrainToSuperviewAttribute:(NSLayoutAttribute)attribute withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation;

@end

#pragma mark - 与视图控制器设置的单个约束
/** 添加与 viewController 相关的约束 */
@interface UIView (CGViewControllerConstraint)

/** 设置 topLayoutGuide 与视图顶部的约束 */
- (NSLayoutConstraint *)cg_topLayoutGuideOfViewController:(UIViewController *)viewController;

/** 设置 topLayoutGuide 与视图顶部的约束(间距) */
- (NSLayoutConstraint *)cg_topLayoutGuideOfViewController:(UIViewController *)viewController withInset:(CGFloat)inset;

/** 设置 topLayoutGuide 与视图顶部的约束(间距，约束类型) */
- (NSLayoutConstraint *)cg_topLayoutGuideOfViewController:(UIViewController *)viewController withInset:(CGFloat)inset relatedBy:(NSLayoutRelation)relation;

/** 设置 bottomLayoutGuide 与视图顶部的约束 */
- (NSLayoutConstraint *)cg_bottomLayoutGuideOfViewController:(UIViewController *)viewController;

/** 设置 bottomLayoutGuide 与视图顶部的约束(间距) */
- (NSLayoutConstraint *)cg_bottomLayoutGuideOfViewController:(UIViewController *)viewController withInset:(CGFloat)inset;

/** 设置 bottomLayoutGuide 与视图顶部的约束(间距，约束类型) */
- (NSLayoutConstraint *)cg_bottomLayoutGuideOfViewController:(UIViewController *)viewController withInset:(CGFloat)inset relatedBy:(NSLayoutRelation)relation;

@end

#pragma mark - 设置视图自身的大小

@interface UIView (CGViewDimensionConstraint)

/** 设置指定大小的长度 */
- (NSLayoutConstraint *)cg_autoDimension:(CGDimension)dimension fixedLength:(CGFloat)fixedLength;

/** 设置指定大小的长度并设置约束类型 */
- (NSLayoutConstraint *)cg_autoDimension:(CGDimension)dimension fixedLength:(CGFloat)fixedLength relation:(NSLayoutRelation)relation;
@end

#pragma mark - 与对象设置的单个约束
@interface UIView (CGAddConstraint)

///** 设置两对象之间的约束(边值类型，约束类型，间距) */
//- (NSLayoutConstraint *)cg_autoConstrainAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(__kindof UIView *)otherView withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation;
//
///** 设置两对象之间的约束(边值类型，约束类型，间距，比例值) */
//- (NSLayoutConstraint *)cg_autoConstrainAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute ofView:(__kindof UIView *)otherView withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation multiplier:(CGFloat)multiplier;

/** 设置两对象之间的约束(边值类型，约束类型) */
- (NSLayoutConstraint *)cg_attribute:(NSLayoutAttribute)attribute toItem:(UIView *)view2;

/** 设置两对象之间的约束(边值类型，约束类型, 间距) */
- (NSLayoutConstraint *)cg_attribute:(NSLayoutAttribute)attribute toItem:(UIView *)view2 constant:(CGFloat)c;

/** 设置两对象之间的约束(边值类型(单个)，约束类型, 间距) */
- (NSLayoutConstraint *)cg_attribute:(NSLayoutAttribute)attribute toItem:(UIView *)view2 relatedBy:(NSLayoutRelation)relation constant:(CGFloat)c;

/** 设置两对象之间的约束(边值类型，约束类型) */
- (NSLayoutConstraint *)cg_attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(UIView *)view2 attribute:(NSLayoutAttribute)attr2;

/** 设置两对象之间的约束(边值类型，约束类型，间距) */
- (NSLayoutConstraint *)cg_attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(UIView *)view2 attribute:(NSLayoutAttribute)attr2 constant:(CGFloat)c;

/** 设置两对象之间的约束(边值类型，约束类型，间距，比例值) */
- (NSLayoutConstraint *)cg_attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(UIView *)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;

@end
NS_ASSUME_NONNULL_END