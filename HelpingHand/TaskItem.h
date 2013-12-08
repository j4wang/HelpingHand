//
//  TaskItem.h
//  HelpingHand
//
//  Created by bgbb on 12/7/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskItem : NSObject


@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imageFile;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (nonatomic) BOOL completed;


@end
