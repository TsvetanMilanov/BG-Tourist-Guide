//
//  ScoreboardViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "ScoreboardViewController.h"
#import "TMCommonServices.h"
#import "TMActivityIndicatorFactory.h"
#import "TMAlertControllerFactory.h"

@interface ScoreboardViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tvScoreboard;

@end

@implementation ScoreboardViewController
{
    TMCommonServices *_services;
    NSMutableArray<TMScoreboardResponseModel*> *_items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _services = [[TMCommonServices alloc] init];
    _items = [NSMutableArray new];
    
    [self loadData];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tvScoreboard setDataSource:self];
    [self.tvScoreboard setDelegate:self];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    TMScoreboardResponseModel *currentRow = _items[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"[%ld] %@ -> Rank: %f", (long)indexPath.row + 1, currentRow.UserName, currentRow.Rating];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

-(void) loadData {
    __weak ScoreboardViewController *weakSelf = self;
    __weak UIActivityIndicatorView *loading = [TMActivityIndicatorFactory activityIndicatorWithParentView:self.view];
    
    [loading startAnimating];

    [_services getScoreboardWithBlock:^(NSError *err, NSMutableArray<TMScoreboardResponseModel *> *result) {
        [loading stopAnimating];
        
        if (err != nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot load the information for scoreboard. Please try again later." uiViewController:self andHandler:nil];
            return;
        }
        
        [_items addObjectsFromArray:result];
        [weakSelf.tvScoreboard reloadData];
    }];
}

@end
