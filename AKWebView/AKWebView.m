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
    // Use if you need the height of the rendered HTML document. Useful for component webviews that may
    // be smaller than the screen.
    return [[self stringByEvaluatingJavaScriptFromString:@"getComputedStyle(document.height);"] floatValue];
}

# pragma mark - Appearance & Behavior

- (void)removeShadows 
{
    for (UIView *subview in self.scrollView.subviews) {
		if ([subview isKindOfClass:[UIImageView class]]) {
			[subview setHidden:YES];
		}
	}
}

- (void)matchBackgroundColorToDocument
{
    // Grab the hex value of the document's background color.
    NSString *rgbString = [self stringByEvaluatingJavaScriptFromString:@"var style = getComputedStyle(document.body,''); style.getPropertyValue('background-color');"];

    // Convert to a UIColor using helper method.
    UIColor *documentColor = [self colorWithRGBString:rgbString];

    // Set as background color for the view. Now when you scroll, the areas above and 
    // below the view will match the document.
    self.backgroundColor = documentColor;
}

#pragma mark - Color Helpers

// TODO: move to category

- (UIColor *)colorWithRGBString:(NSString *)string 
{
    NSString *rgbValuesString = [string stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"rgba()"]];
    NSArray *rgbValues = [rgbValuesString componentsSeparatedByString:@","];
    if ([rgbValues count] >= 3) {
        CGFloat r = [[rgbValues objectAtIndex:0] floatValue];
        CGFloat g = [[rgbValues objectAtIndex:1] floatValue];
        CGFloat b = [[rgbValues objectAtIndex:2] floatValue];
        CGFloat a = 1.0;
        
        // alpha value is not present for opaque colors, we need to check for this
        if ([rgbValues count] == 4) {
            a = [[rgbValues objectAtIndex:3] floatValue];
        }
        return [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a];
    } else {
        NSLog(@"Tried to create a color from an invalid RGB string. Returning a white color.");
        return [UIColor whiteColor];
    }
}

- (UIColor *)colorWithHexString:(NSString *)string 
{
    NSScanner *scanner = [NSScanner scannerWithString:string];
    unsigned int hexInt;
    
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    
    if ([scanner scanHexInt:&hexInt]) {
        int r = (hexInt >> 16) & 0xFF; //first byte
        int g = (hexInt >> 8) & 0xFF; // middle byte
        int b = (hexInt) & 0xFF; //last bye
        return [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1.0];
    } else {
        NSLog(@"Tried to create a color from an invalid hex string. Returning a white color.");
        return [UIColor whiteColor];
    }
}

@end
