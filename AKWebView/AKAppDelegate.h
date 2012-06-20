//
//  AKAppDelegate.h
//  AKWebView
//
//  Created by Anne Halsall on 6/20/12.
//  Copyright (c) 2012 Anne K. Halsall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKWebViewController;

@interface AKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) AKWebViewController *wbvc;

@end
