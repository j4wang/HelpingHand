//
//  ListVC.h
//  HelpingHand
//
//  Created by bgbb on 12/7/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ListVC : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
