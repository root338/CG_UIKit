//
//  CGWKWebViewDelegateManager.h
//  TestCG_CGKit
//
//  Created by DY on 16/10/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@import WebKit;

NS_ASSUME_NONNULL_BEGIN

@class CGWebView;
@protocol CGWebViewDelegate;

//WKWebView 相关代理方法设置
@interface CGWKWebViewDelegateManager : NSObject<WKNavigationDelegate>

@property (nonatomic, weak) WKWebView *webView;

@property (nonatomic, weak) id<CGWebViewDelegate> delegate;
@property (nonatomic, weak) CGWebView *targetObject;

+ (instancetype)createManagerWithDelegate:(id<CGWebViewDelegate>)delegate targetObj:(CGWebView *)targetObj;
@end

NS_ASSUME_NONNULL_END
