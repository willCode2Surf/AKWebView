//
//  AKWebView.m
//  AKWebView
//
//  Created by Anne Halsall on 6/20/12.
//  Copyright (c) 2012 Anne K. Halsall. All rights reserved.
//

#import "AKWebView.h"

@implementation AKWebView
@synthesize documentHeight = _documentHeight;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

# pragma mark - Properties

- (CGFloat)documentHeight 
{
    return [[self stringByEvaluatingJavaScriptFromString:@"getComputedStyle(document.height);"] floatValue];
}

# pragma mark - Appearance

- (void)removeShadows 
{
    for (UIView *subview in self.scrollView.subviews) {
		if ([subview isKindOfClass:[UIImageView class]]) {
			[subview setHidden:YES];
		}
	}
}

@end
