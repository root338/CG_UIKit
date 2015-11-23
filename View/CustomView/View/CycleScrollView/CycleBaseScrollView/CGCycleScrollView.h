//
//  CGCycleScrollView.h
//  QuickAskCommunity
//
//  Created by DY on 15/11/23.
//  Copyright © 2015年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGCycleScrollView;

@protocol CGCycleScrollViewDataSource <NSObject>

/**
 *  设置滑动视图有多少个视图
 *
 *  @param cycleScrollView 当前循环滑动视图
 *
 *  @return 添加多少个子视图
 */
- (NSInteger)numberCycleScrollView:(CGCycleScrollView *)cycleScrollView;

/**
 *  设置每个自定义的滑动视图
 *
 *  @param cycleScrollView 当前循环滑动视图
 *  @param index           设置滑动视图的索引
 *
 *  @return 返回设置的当前的滑动视图
 */
- (UIView *)cycleScrollView:(CGCycleScrollView *)cycleScrollView viewAtIndex:(NSInteger)index;

@end

@protocol CGCycleScrollViewDelegate <NSObject>

@optional
/**
 *  已选择时的视图
 *
 *  @param cycleScrollView 当前循环滑动视图
 *  @param index           视图的索引
 */
- (void)cycleScrollView:(CGCycleScrollView *)cycleScrollView didSelectRowAtIndex:(NSInteger)index;

@end

/**
 循环滑动视图的基类
 */
@interface CGCycleScrollView : UIView

#pragma mark - 代理
/**
 添加数据代理
 */


@property (weak, nonatomic) id<CGCycleScrollViewDataSource> dataSource;

@property (weak, nonatomic) id<CGCycleScrollViewDelegate> delegate;

#pragma mark - 滑动设置
/**
 是否循环滑动视图 默认为YES
 */
@property (assign, nonatomic) BOOL isCycle;

/**
 是否自动滑动，默认为NO
 当设值为YES时，delayTimeInterval属性为 2
 */
@property (assign, nonatomic) BOOL isAutoScrollView;

/**
 每隔多少秒滑动一次
 必须设置isAutoScrollView为YES，才能启动自动滑动
 */
@property (assign, nonatomic) NSTimeInterval delayTimeInterval;

#pragma mark - 内容设置
///当前显示视图的索引
@property (nonatomic, assign) NSInteger currentIndex;

///滑动视图相对父视图的四周边距
@property (assign, nonatomic) UIEdgeInsets marginEdgeInsetForScrollView;

/** 
 *  是否缓存已创建的视图
 *  当设值为YES时，maxCacheCountForViews属性为0时，默认设置为 5
 */
@property (assign, nonatomic) BOOL isCacheViews;

/** 缓存的最大数 */
@property (assign, nonatomic) NSUInteger maxCacheCountForViews;

/**
 *  刷新视图
 */
- (void)reloadAllView;

/**
 *  创建循环滑动视图
 *
 *  @param frame             滑动视图的区域
 *  @param delayTimeInterval 自动滑动延长的时间
 */
- (instancetype)initWithFrame:(CGRect)frame delayTimeInterval:(NSTimeInterval)delayTimeInterval;
@end