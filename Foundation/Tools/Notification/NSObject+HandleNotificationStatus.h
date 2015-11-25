//
//  NSObject+HandleNotificationStatus.h
//  QuickAskCommunity
//
//  Created by DY on 15/10/12.
//  Copyright © 2015年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef SEL (^SelectorBlock)(NSString *notificationName, NSInteger index);
typedef id  (^ObjectBlock)(NSString *notificationName, NSInteger index);

@interface NSObject (HandleNotificationStatus)

/**
 *  打开或关闭一组通知
 *
 *  @param names    通知名字的数组
 *  @param isRemove YES 移除通知， NO 打开通知
 */
- (void)notificationWithNames:(NSArray *)names isRemove:(BOOL)isRemove observer:(id)target selector:(SEL)selector object:(id)object;

/**
 *  打开或关闭一组通知（block回调）
 *
 *  @param names         通知名字数组
 *  @param isRemove      YES 移除通知， NO 打开通知
 *  @param targetBlock   block 回调，设置目标
 *  @param selectorBlock block 回调，设置方法
 *  @param objectBlock   block 回调，设置添加对象
 */
- (void)notificationWithNames:(NSArray *)names isRemove:(BOOL)isRemove observer:(ObjectBlock)targetBlock selectorblock:(SelectorBlock)selectorBlock objectBlock:(ObjectBlock)objectBlock;
@end