//
//  HHGoalViewController.m
//  HelpingHand
//
//  Created by Leah Dorner on 12/7/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import "HHGoalViewController.h"
#import "HHLearnViewController.h"

@interface HHGoalViewController ()

@end

@implementation HHGoalViewController {
    UIView *_view;
    UIButton *_jobButton;
    UIButton *_degButton;
    UIButton *_learnButton;
    UIButton *_busButton;
}

- (id)init
{
    self = [super init];
    if (self) {
       [self.navigationController setNavigationBarHidden:YES];
        UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
        UIImage *splash = [UIImage imageNamed:@"HHSplash"];
        [splash drawInRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        UIImage *resizedSplash = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        CGRect viewRect = CGRectMake(0, 0, 100, 100);
        _view = [[UIView alloc] initWithFrame:viewRect];
        _view.backgroundColor = [UIColor colorWithPatternImage:resizedSplash];
  
        UIImage *navBar = [UIImage imageNamed:@"TopNavBar.png"];
        float navHeight = navBar.size.height;
        CGRect navFrame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, navHeight);
        UIImageView *navView = [[UIImageView alloc] initWithImage:navBar];
        navView.frame = navFrame;
        [_view addSubview:navView];
        
        CGRect labelFrame = CGRectMake(0, navHeight, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3);
        UILabel *whatLearnLabel = [[UILabel alloc] initWithFrame:labelFrame];
        whatLearnLabel.textColor = [UIColor whiteColor];
        whatLearnLabel.textAlignment = UITextAlignmentCenter;
        whatLearnLabel.font = [UIFont fontWithName:@"Helvetica New" size:60.0f];
        whatLearnLabel.text = @"What is \n your goal?";
        whatLearnLabel.numberOfLines = 0;
        whatLearnLabel.lineBreakMode = UILineBreakModeWordWrap;
        [whatLearnLabel setFont:[UIFont systemFontOfSize:40]];
        [_view addSubview:whatLearnLabel];
        
        CGRect jobButtonFrame = CGRectMake(10, navFrame.size.height + labelFrame.size.height, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height/9);
        UIButton *jobButton = [[UIButton alloc] initWithFrame:jobButtonFrame];
        jobButton.titleLabel.font = [UIFont fontWithName:@"Helvetica New" size:20.0f];
        jobButton.titleLabel.font = [UIFont systemFontOfSize:30];
        [jobButton setTitle:@"Find a job" forState:UIControlStateNormal];
        [[jobButton layer] setCornerRadius:0.0];
        [[jobButton layer] setBorderColor:[[UIColor redColor] CGColor]];
        [[jobButton layer] setBorderWidth:1.0];
        [jobButton addTarget:self action:@selector(clickJob) forControlEvents:UIControlEventTouchUpInside];
        _jobButton = jobButton;
        [_view addSubview:jobButton];
        
        CGRect busButtonFrame = CGRectMake(10, navFrame.size.height + labelFrame.size.height + jobButtonFrame.size.height + 5, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height/9);
        UIButton *busButton = [[UIButton alloc] initWithFrame:busButtonFrame];
        busButton.titleLabel.font = [UIFont fontWithName:@"Helvetica New" size:20.0f];
        busButton.titleLabel.font = [UIFont systemFontOfSize:30];
        [busButton setTitle:@"Grow a business" forState:UIControlStateNormal];
        [[busButton layer] setCornerRadius:0.0];
        [[busButton layer] setBorderColor:[[UIColor redColor] CGColor]];
        [[busButton layer] setBorderWidth:1.0];
        [busButton addTarget:self action:@selector(clickBus) forControlEvents:UIControlEventTouchUpInside];
        _busButton = busButton;
        [_view addSubview:busButton];
        
        CGRect degButtonFrame = CGRectMake(10, navFrame.size.height + labelFrame.size.height + jobButtonFrame.size.height*2 + 10, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height/9);
        UIButton *degButton = [[UIButton alloc] initWithFrame:degButtonFrame];
        degButton.titleLabel.font = [UIFont fontWithName:@"Helvetica New" size:20.0f];
        degButton.titleLabel.font = [UIFont systemFontOfSize:30];
        [degButton setTitle:@"Get a degree" forState:UIControlStateNormal];
        [[degButton layer] setCornerRadius:0.0];
        [[degButton layer] setBorderColor:[[UIColor redColor] CGColor]];
        [[degButton layer] setBorderWidth:1.0];
        [degButton addTarget:self action:@selector(clickDeg) forControlEvents:UIControlEventTouchUpInside];
        _degButton = degButton;
        [_view addSubview:degButton];
        
        CGRect learnButtonFrame = CGRectMake(10, navFrame.size.height + labelFrame.size.height + jobButtonFrame.size.height*3 + 15, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.height/9);
        UIButton *learnButton = [[UIButton alloc] initWithFrame:learnButtonFrame];
        learnButton.titleLabel.font = [UIFont fontWithName:@"Helvetica New" size:20.0f];
        learnButton.titleLabel.font = [UIFont systemFontOfSize:30];
        [learnButton setTitle:@"Learn a new skill" forState:UIControlStateNormal];
        [[learnButton layer] setCornerRadius:0.0];
        [[learnButton layer] setBorderColor:[[UIColor redColor] CGColor]];
        [[learnButton layer] setBorderWidth:1.0];
        [learnButton addTarget:self action:@selector(clickLearn) forControlEvents:UIControlEventTouchUpInside];
        _learnButton = learnButton;
        [_view addSubview:learnButton];
        
        CGRect navPrevLowerFrame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - [UIScreen mainScreen].bounds.size.height/10, [UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/10);
        UIButton *navPrevButton = [[UIButton alloc] initWithFrame:navPrevLowerFrame];
        navPrevButton.titleLabel.font = [UIFont fontWithName:@"Helvetica New" size:20.0f];
        navPrevButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [navPrevButton setTitle:@"Skip" forState:UIControlStateNormal];
        [navPrevButton addTarget:self action:@selector(clickNext) forControlEvents:UIControlEventTouchUpInside];
        [_view addSubview:navPrevButton];
        
        CGRect navNextLowerFrame = CGRectMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height - [UIScreen mainScreen].bounds.size.height/10, [UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/10);
        UIButton *navNextButton = [[UIButton alloc] initWithFrame:navNextLowerFrame];
        navNextButton.titleLabel.font = [UIFont fontWithName:@"Helvetica New" size:20.0f];
        navNextButton.titleLabel.font = [UIFont systemFontOfSize:20];
        [navNextButton setTitle:@"Next" forState:UIControlStateNormal];
        [navNextButton addTarget:self action:@selector(clickNext) forControlEvents:UIControlEventTouchUpInside];
        [_view addSubview:navNextButton];
        
        self.view =_view;
    }
    return self;
}


- (void)clickJob {
    if ([[_jobButton layer] borderWidth] > 1.0) {
        [[_jobButton layer] setBorderWidth:1.0];
    } else {
        [[_jobButton layer] setBorderWidth:5.0];
    }
}

- (void)clickBus {
    if ([[_busButton layer] borderWidth] > 1.0) {
        [[_busButton layer] setBorderWidth:1.0];
    } else {
        [[_busButton layer] setBorderWidth:5.0];
    }
}

- (void)clickDeg {
    if ([[_degButton layer] borderWidth] > 1.0) {
        [[_degButton layer] setBorderWidth:1.0];
    } else {
        [[_degButton layer] setBorderWidth:5.0];
    }
}

- (void)clickLearn {
    if ([[_learnButton layer] borderWidth] > 1.0) {
        [[_learnButton layer] setBorderWidth:1.0];
    } else {
        [[_learnButton layer] setBorderWidth:5.0];
    }
}

- (void)clickNext {
    HHLearnViewController *svc = [[HHLearnViewController alloc] init];
    [self.navigationController pushViewController:svc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
