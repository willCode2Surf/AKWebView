//
//  AKWebViewController.h
//  AKWebView
//
//  Created by Anne Halsall on 6/20/12.
//  Copyright (c) 2012 Anne K. Halsall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKWebView;

@interface AKWebViewController : UIViewController <UIWebViewDelegate>

@property (retain, nonatomic) AKWebView *webView;

@end
