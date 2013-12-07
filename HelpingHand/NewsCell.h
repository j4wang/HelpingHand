//
//  NewsCell.h
//  HelpingHand
//
//  Created by bgbb on 12/7/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UITextView *descriptionText;

@end
