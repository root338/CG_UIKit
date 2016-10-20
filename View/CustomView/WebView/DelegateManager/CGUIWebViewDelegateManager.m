//
//  CGUIWebViewDelegateManager.m
//  TestCG_CGKit
//
//  Created by DY on 16/10/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGUIWebViewDelegateManager.h"
#import "NJKWebViewProgress.h"

#import "CGWebViewDelegate.h"

#import "CGWebView.h"

#import "UIWebView+CGValue.h"

@interface CGUIWebViewDelegateManager ()<NJKWebViewProgressDelegate>
{
    NJKWebViewProgress  *progressProxy;
}

@property (nonatomic, readonly) CGWebView *webView;

@end

@implementation CGUIWebViewDelegateManager

+ (instancetype)createManagerWithDelegate:(id<CGWebViewDelegate>)delegate webViewPrivateProxyDelegate:(nonnull id<CGWebViewPrivateProxyDelegate>)webViewPrivateProxyDelegate
{
    CGUIWebViewDelegateManager *manager = [[self alloc] init];
    manager.delegate                    = delegate;
    manager.webViewPrivateProxyDelegate = webViewPrivateProxyDelegate;
    return manager;
}

- (CGWebView *)webView
{
    return self.webViewPrivateProxyDelegate.webViewForPrivateObject;
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    BOOL result = YES;
    if ([self.delegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        result  = [self.delegate webView:self.webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    if (result == NO && [self.delegate respondsToSelector:@selector(webViewDidCancelRequest:)]) {
        [self.delegate webViewDidCancelRequest:self.webView];
    }
    return result;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if ([self.delegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [self.delegate webViewDidStartLoad:self.webView];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if ([self.delegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [self.delegate webViewDidFinishLoad:self.webView];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [self.delegate webView:self.webView didFailLoadWithError:error];
    }
}

#pragma mark - NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    if ([self.delegate respondsToSelector:@selector(webView:updateProgress:)]) {
        [self.delegate webView:self.webView updateProgress:progress];
    }
    
    UIWebView *webView  = self.webView.webView;
    NSString *title = webView.title;
    if (title.length > 0) {
        if ([self.delegate respondsToSelector:@selector(webView:webViewTitle:)]) {
            
            [self.delegate webView:self.webView webViewTitle:title];
        }
    }
}

- (void)resetWebViewLoad
{
    [progressProxy reset];
}

#pragma mark - 设置属性

- (id<UIWebViewDelegate>)webViewProxyDelegate
{
    if (progressProxy == nil) {
        progressProxy   = [[NJKWebViewProgress alloc] init];
        progressProxy.webViewProxyDelegate  = self;
        progressProxy.progressDelegate      = self;
    }
    return progressProxy;
}

@end
