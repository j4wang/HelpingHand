//
//  HHSplashViewController.m
//  HelpingHand
//
//  Created by Leah Dorner on 12/7/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import "HHSplashViewController.h"
#import "HHLoginViewController.h"

@interface HHSplashViewController ()

@end

@implementation HHSplashViewController {
    UIView *_view;
}

- (id)init
{
    self = [super init];
    if (self) {
        UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
        UIImage *splash = [UIImage imageNamed:@"HHSplash.png"];
        [splash drawInRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        UIImage *resizedSplash = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        CGRect viewRect = CGRectMake(0, 0, 100, 100);
        _view = [[UIView alloc] initWithFrame:viewRect];
        _view.backgroundColor = [UIColor colorWithPatternImage:resizedSplash];
        self.view = _view;
    }
    return self;
}

- (void)viewDidLoad
{
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
