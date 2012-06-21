//
//  AKWebViewController.m
//  AKWebView
//
//  Created by Anne Halsall on 6/20/12.
//  Copyright (c) 2012 Anne K. Halsall. All rights reserved.
//

#import "AKWebViewController.h"
#import "AKWebView.h"

@interface AKWebViewController ()

@end

@implementation AKWebViewController
@synthesize webView = _webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.opaque = YES;
    
    self.webView = [[AKWebView alloc] initWithFrame:self.view.bounds];
    
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.webView.delegate = self;

    [self.webView removeShadows];
    
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"titan" ofType:@"html"] isDirectory:NO]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.webView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - UIWebView delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView 
{
    // The document needs to be done loading before we can get the background color.
    [(AKWebView*)webView matchBackgroundColorToDocument];
}

@end
