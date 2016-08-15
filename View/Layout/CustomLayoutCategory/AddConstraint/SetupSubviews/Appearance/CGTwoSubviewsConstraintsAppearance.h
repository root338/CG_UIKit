//
//  CGTwoSubviewsConstraintsAppearance.h
//  TestCG_CGKit
//
//  Created by apple on 16/8/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGBaseObject.h"
#import "CGAlignmentHeader.h"
#import "CGLayoutConstraintsTypeHeader.h"

NS_ASSUME_NONNULL_BEGIN
/** 两个视图的配置 */
@interface CGTwoSubviewsConstraintsAppearance : CGBaseObject

@property (nonatomic, weak) UIView *superView;

//设置两个视图
//为空时，默认提取父视图的subviews视图
//当firstView为空时 默认为 subviews 第一个视图
//当secondView为空时 默认为 subviews 第二个视图

@property (nullable, nonatomic, strong) UIView *firstView;
@property (nullable, nonatomic, strong) UIView *secondView;

//设置两个视图的对齐方式
//当水平对齐时 firstView 在左边 ，垂直对齐时 firstView 在上边 默认水平
@property (nonatomic, assign) CGAlignmentType alignmentType;

//设置两个视图与父视图的边距
//当水平对齐时 firstViewEdgeInsets 的 right 边距无效， secondViewEdgeInsets 的 left 边距无效
//当垂直对齐时 firstViewEdgeInsets 的 bottom 边距无效, secondViewEdgeInsets 的 top 边距无效

@property (nonatomic, assign) UIEdgeInsets firstViewEdgeInsets;
@property (nonatomic, assign) UIEdgeInsets secondViewEdgeInsets;
@property (nonatomic, assign, readwrite) UIEdgeInsets edgeInsets;

//两个视图之间的间距
@property (nonatomic, assign) CGFloat firstViewToSecondViewSpace;

//设置两个视图是否居中显示
//当水平对齐时，居中代表垂直居中
//当垂直对齐时，居中代表水平居中


@property (nonatomic, assign) CGLayoutEdge firstViewEqualSecondViewEdge;

@property (nonatomic, assign) BOOL firstViewCenter;
@property (nonatomic, assign) BOOL secondViewCenter;
@property (nonatomic, assign, readwrite) BOOL center;

//设置两个视图的大小

@property (nonatomic, assign) CGFloat firstViewWidth;
@property (nonatomic, assign) CGFloat firstViewHeight;
@property (nonatomic, assign) CGFloat secondViewWidth;
@property (nonatomic, assign) CGFloat secondViewHeight;

@property (nonatomic, assign, readwrite) CGSize firstViewSize;
@property (nonatomic, assign, readwrite) CGSize secondViewSize;
@property (nonatomic, assign, readwrite) CGSize size;

@property (nonatomic, assign) BOOL widthEqual;
@property (nonatomic, assign) BOOL heightEqual;
//两个子视图的大小是否相等
@property (nonatomic, assign, readwrite) BOOL sizeEqual;


+ (instancetype)createConfigWithSuperview:(UIView *)superview;

/** 
 *  获取指定视图的两个子视图数组
 *  @param superview 为空时自动赋值为 superview 实例属性值
 */
- (NSArray<UIView *> *)getTwoSubviewsWithSuperview:(nullable UIView *)superview;
@end

NS_ASSUME_NONNULL_END