//
//  NotebookListTableVCViewController.m
//  HelpingHand
//
//  Created by John on 12/7/13.
//  Copyright (c) 2013 HelpingHand. All rights reserved.
//

#import "NotebookListTableVC.h"
#import "NotebookTextItemCell.h"
#import "NotebookImageItemCell.h"

@interface NotebookListTableVC ()

@property (nonatomic, strong) NSMutableArray *notebookItems;
- (void)reload;

@end

@implementation NotebookListTableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // register the custom cells
    UINib *customImageNib = [UINib nibWithNibName:@"NotebookImageItemCell" bundle:nil];
    UINib *customTextNib = [UINib nibWithNibName:@"NotebookTextItemCell" bundle:nil];
    
    [self.tableView registerNib: customImageNib forCellReuseIdentifier:@"NotebookImageItemCell"];
    [self.tableView registerNib:customTextNib forCellReuseIdentifier:@"NotebookTextItemCell"];
    
    // add pull to refresh
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    [refresh addTarget:self action:@selector(reload)forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;
    
    // add custom header
    /*
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 30)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, headerView.frame.size.width-120.0, headerView.frame.size.height)];
    
    headerLabel.textAlignment = UITextAlignmentLeft;
    headerLabel.text = @"My Notebook";
    [headerLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:17.0]];
    self.tableView.tableHeaderView = headerView;
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ImageCellIdentifier = @"NotebookImageItemCell";
    static NSString *TextCellIdentifier = @"NotebookTextItemCell";
    
    NotebookTextItemCell *cell = [tableView dequeueReusableCellWithIdentifier:TextCellIdentifier forIndexPath:indexPath];
    //NotebookImageItemCell *imageCell = [tableView dequeueReusableCellWithIdentifier:ImageCellIdentifier forIndexPath:indexPath];
    
    return cell;
}


-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  130.0;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

#pragma mark - Refresh methods
- (void)stopRefresh
{
    [self.refreshControl endRefreshing];
}

#pragma mark - Private methods
- (void)reload {
    // add for pull to refresh
    [self performSelector:@selector(stopRefresh) withObject:nil afterDelay:2.5];
}

@end
