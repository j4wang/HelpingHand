//  HHLoginViewController.m
//  HelpingHand
//
//  Created by Leah Dorner on 12/6/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import "HHLoginViewController.h"
#import "HHGoalViewController.h"

@interface HHLoginViewController ()

@end

@implementation HHLoginViewController {
    UIView *_view;
    
}


- (id)init
{
    self = [super init];
    if (self) {
        CGRect viewRect = CGRectMake(0, 0, 100, 100);
        _view = [[UIView alloc] initWithFrame:viewRect];
        _view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"OrangeBackground.png"]];
        
        UIImage *logo = [UIImage imageNamed:@"HHLogo.png"];
        float logoHeight = logo.size.height;
        float logoWidth = logo.size.width;
        CGRect logoFrame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - logoWidth/2, [UIScreen mainScreen].bounds.size.height/2 - logoHeight, logoWidth, logoHeight);
        UIImageView *logoView = [[UIImageView alloc] initWithImage:logo];
        logoView.frame = logoFrame;
        [_view addSubview:logoView];
        
        
        UIImage *signInTwitterImage = [UIImage imageNamed:@"TwitterButton.png"];
        float twttrButtonHeight = signInTwitterImage.size.height * .4;
        float twttrButtonWidth = signInTwitterImage.size.width * .4;
        CGRect buttonFrame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - twttrButtonWidth/2, [UIScreen mainScreen].bounds.size.height/2 + twttrButtonHeight*1.2, twttrButtonWidth, twttrButtonHeight);
        UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        signInButton.frame = buttonFrame;
        [signInButton setBackgroundImage:signInTwitterImage forState:UIControlStateNormal];
        [signInButton addTarget:self action:@selector(clickNext) forControlEvents:UIControlEventTouchUpInside];
        [_view addSubview:signInButton];
        
        UIImage *questionImage = [UIImage imageNamed:@"Screen2HelpQuestion.png"];
        float questionHeight = questionImage.size.height * .35;
        float questionWidth = questionImage.size.width * .35;
        CGRect questionFrame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - questionWidth/2, [UIScreen mainScreen].bounds.size.height - questionHeight*1.2, questionWidth, questionHeight);
        UIImageView *questionView = [[UIImageView alloc] initWithImage:questionImage];
        questionView.frame = questionFrame;
        [_view addSubview:questionView];
        [_view addSubview:questionView];
        
        self.view =_view;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)clickNext {
    HHGoalViewController *svc = [[HHGoalViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end