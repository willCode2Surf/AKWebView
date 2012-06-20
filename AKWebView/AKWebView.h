//
//  AKWebView.h
//  AKWebView
//
//  Created by Anne Halsall on 6/20/12.
//  Copyright (c) 2012 Anne K. Halsall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AKWebView : UIWebView

@property (nonatomic, assign, readonly) CGFloat documentHeight;

- (void)removeShadows;

@end
