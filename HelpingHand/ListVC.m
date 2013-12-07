//
//  ListVC.m
//  HelpingHand
//
//  Created by bgbb on 12/7/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import "ListVC.h"
#import "TaskItem.h"
#import "AnnouncementCell.h"
#import "NewsCell.h"

@interface ListVC ()
@property (strong, nonatomic)NSMutableArray *taskList;

@end

@implementation ListVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        if (!self.taskList){
            TaskItem *item1 = [[TaskItem alloc] init];
            item1.title = @"Business Writing";
            item1.imageFile = @"biz_writing.jpg";
            item1.completed = NO;
            TaskItem *item2 = [[TaskItem alloc] init];
            item2.title = @"Funding";
            item2.imageFile = @"funding.jpg";
            item2.completed = NO;
            TaskItem *item3 = [[TaskItem alloc] init];
            item3.title = @"Setting up business";
            item3.imageFile = @"office.jpg";
            item3.completed = NO;
            TaskItem *item4 = [[TaskItem alloc] init];
            item4.title = @"Hiring";
            item4.imageFile = @"hiring.jpg";
            item3.completed = NO;
            TaskItem *item5 = [[TaskItem alloc] init];
            item3.title = @"Resources";
            item3.imageFile = @"resource.jpg";
            item3.completed = NO;
            TaskItem *item6 = [[TaskItem alloc] init];
            item3.title = @"How to Grow";
            item3.imageFile = @"growth.jpg";
            item3.completed = NO;
            
            self.taskList = @[item1, item2, item3, item4, item5, item6];
        }
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //register custom cell
    UINib *announcementCell = [UINib nibWithNibName:@"AnnouncementCell" bundle:nil];
    [self.tableView registerNib:announcementCell                               forCellReuseIdentifier:@"AnnouncementCell"];
    
    //register custom cell
    UINib *newsCell = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [self.tableView registerNib:newsCell                               forCellReuseIdentifier:@"NewsCell"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *AnnouncementCellId = @"AnnouncementCell";
    static NSString *NewsCellId = @"NewsCell";
    //first 2 rows are announcement
    if (indexPath.row<2){
        AnnouncementCell *annCell = [tableView dequeueReusableCellWithIdentifier:AnnouncementCellId forIndexPath:indexPath];
        return annCell;
    }
    //next rows are news
    NewsCell *newsCell = [tableView dequeueReusableCellWithIdentifier:NewsCellId forIndexPath:indexPath];
    return newsCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // static NSString *CellIdentifier = @"TweetCell";
    // TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //  Tweet *tweet = self.tweets[indexPath.row];
    //    NSAttributedString *tweetAttrText = [[NSAttributedString alloc] initWithString:tweet.text];
    //    NSLog(@"tweet text:%@",tweet.text);
    //    CGRect rect = [tweetAttrText boundingRectWithSize:CGSizeMake(self.view.bounds.size.width-40,CGFLOAT_MAX)
    //                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
    //                                              context:nil];
    //    CGSize textSize = [tweet.text sizeWithFont:[UIFont fontWithName: @"System" size: 14.0f]
    //                              constrainedToSize:kLabelFrameMaxSize];

    return 80;
}



@end
