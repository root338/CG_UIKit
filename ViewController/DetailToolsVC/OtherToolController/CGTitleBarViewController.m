//
//  CGTitleBarViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/2/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTitleBarViewController.h"

@interface CGTitleBarViewController ()
{
    BOOL _titleDidAddToNavigationBar;
}

@property (nullable, nonatomic, strong, readwrite) NSMutableDictionary<NSNumber *, NSDictionary *> *leftItemTitleAttributesDict;
@property (nullable, nonatomic, strong, readwrite) NSMutableDictionary<NSNumber *, NSDictionary *> *rightItemTitleAttributesDict;

@end

@implementation CGTitleBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigationItemContent];
}

- (void)setupNavigationItemContent
{
    if (!_titleDidAddToNavigationBar) {
        
        NSArray<UIBarButtonItem *> *leftItems   = [self setupLeftItemButtons];
        NSArray<UIBarButtonItem *> *rightItems  = [self setupRightItemButtons];
        
        if (leftItems || rightItems) {
            
            UINavigationItem *navigationItem    = [[UINavigationItem alloc] init];
            
            !leftItems ?: [navigationItem setLeftBarButtonItems:leftItems];
            !rightItems ?: [navigationItem setRightBarButtonItems:rightItems];
            
            [self.navigationBar pushNavigationItem:navigationItem animated:YES];
        }
        _titleDidAddToNavigationBar = YES;
    }
}

#pragma mark - 事件触发
- (void)handleLeftItemAction:(id)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)handleRightItemAction:(id)sender
{
    
}

#pragma mark - 标题按钮设置
- (NSArray<UIBarButtonItem *> *)setupLeftItemButtons
{
    UIBarButtonItem *leftItem   = nil;
    if (self.leftItemTitle) {
        leftItem    = [[UIBarButtonItem alloc] initWithTitle:self.leftItemTitle style:UIBarButtonItemStyleDone target:self action:@selector(handleLeftItemAction:)];
        [self.leftItemTitleAttributesDict enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSDictionary * _Nonnull obj, BOOL * _Nonnull stop) {
            [leftItem setTitleTextAttributes:obj forState:[key integerValue]];
        }];
    }
    return @[leftItem];
}

- (NSArray<UIBarButtonItem *> *)setupRightItemButtons
{
    UIBarButtonItem *rightItem  = nil;;
    if (self.rightItemTitle) {
        rightItem   = [[UIBarButtonItem alloc] initWithTitle:self.rightItemTitle style:UIBarButtonItemStyleDone target:self action:@selector(handleRightItemAction:)];
        [self.rightItemTitleAttributesDict enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSDictionary * _Nonnull obj, BOOL * _Nonnull stop) {
            [rightItem setTitleTextAttributes:obj forState:[key integerValue]];
        }];
    }
    return @[rightItem];
}

- (void)cg_setTitleTextAttributes:(NSDictionary<NSString *,id> *)attributes forState:(UIControlState)state type:(CGTitleBarItemType)type
{
    if (!attributes) {
        return;
    }
    
    if (CGTitleBarItemTypeLeft == type) {
        if (self.leftItemTitleAttributesDict == nil) {
            self.leftItemTitleAttributesDict    = [NSMutableDictionary dictionaryWithCapacity:1];
        }
        [self.leftItemTitleAttributesDict setObject:attributes forKey:@(state)];
    }else if (CGTitleBarItemTypeRight == type) {
        if (self.rightItemTitleAttributesDict == nil) {
            self.rightItemTitleAttributesDict   = [NSMutableDictionary dictionaryWithCapacity:1];
        }
        [self.rightItemTitleAttributesDict setObject:attributes forKey:@(state)];
    }
}

#pragma mark - 设置属性

@end