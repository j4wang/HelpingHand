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
@property (strong, nonatomic)NSArray *taskList;

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
            item1.imageFile = @"NotebookIcon.png";
            item1.description = @"Drag and Drop your content to your notebook to build your study list";
            item1.completed = NO;
            TaskItem *item2 = [[TaskItem alloc] init];
            item2.title = @"Funding";
            item2.imageFile = @"MarketplaceIcon.png";
            item2.description = @"Earn points by completing activities and use the Marketplace to trade them in";
            item2.completed = NO;
            TaskItem *item3 = [[TaskItem alloc] init];
            item3.title = @"Featured Member";
            item3.name = @"Jinya Ramadi";
            item3.imageFile = @"JinyaIcon.png";
            item3.description = @"My goal is to become a teacher. I am looking for a mentor.";
            item3.completed = NO;
            TaskItem *item4 = [[TaskItem alloc] init];
            item4.title = @"Finance";
            item4.imageFile = @"BankIcon.png";
            item4.description = @"Learn how to register your business by using bank.";
            item4.completed = NO;
            
            TaskItem *item5 = [[TaskItem alloc] init];
            item5.title = @"Resources";
            item5.imageFile = @"BankIcon.jpg";
            item5.completed = NO;
            TaskItem *item6 = [[TaskItem alloc] init];
            item6.title = @"How to Grow";
            item6.imageFile = @"growth.jpg";
            item6.completed = NO;
            
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
    [self.tableView registerNib:newsCell forCellReuseIdentifier:@"NewsCell"];
    
    self.bottomNav.image = [UIImage imageNamed:@"BottomNavBar.png"];
    
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *AnnouncementCellId = @"AnnouncementCell";
    static NSString *NewsCellId = @"NewsCell";
    //first 2 rows are announcement
    if (indexPath.row<2){
        AnnouncementCell *annCell = [tableView dequeueReusableCellWithIdentifier:AnnouncementCellId forIndexPath:indexPath];
        annCell.announcementContent.text = [self.taskList[indexPath.row] description];
        annCell.imageView.image = [UIImage imageNamed:[self.taskList[indexPath.row] imageFile]];
        return annCell;
    }
    
//    @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//    
//    @property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//    
//    @property (weak, nonatomic) IBOutlet UIImageView *profileImage;
//    @property (weak, nonatomic) IBOutlet UITextView *descriptionText;
    //next rows are news
    NewsCell *newsCell = [tableView dequeueReusableCellWithIdentifier:NewsCellId forIndexPath:indexPath];
    newsCell.nameLabel.text = [self.taskList[indexPath.row] name];
    newsCell.titleLabel.text = [self.taskList[indexPath.row] title];
    newsCell.descriptionText.text = [self.taskList[indexPath.row] description];
    newsCell.profileImage.image = [UIImage imageNamed:[self.taskList[indexPath.row] imageFile]];
    return newsCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
        return 60;
    else if (indexPath.row==1)
        return 70;
    return 90;
}



@end
