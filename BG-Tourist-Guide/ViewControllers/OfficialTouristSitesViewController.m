//
//  OfficialTouristSitesViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "OfficialTouristSitesViewController.h"
#import "TMTouristSitesServices.h"
#import "ParentDetailsViewController.h"

@interface OfficialTouristSitesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tvItems;

@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;

- (IBAction)btnLoadMoreTap:(id)sender;

@end

@implementation OfficialTouristSitesViewController
{
    NSMutableArray *_items;
    NSInteger _currentPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage = 1;
    __weak OfficialTouristSitesViewController *weakSelf = self;
    
    TMTouristSitesServices *touristSites = [[TMTouristSitesServices alloc] init];
    [touristSites getParentTouristSitesNamesForPage: &(_currentPage) andBlock:^(NSError *err, NSArray<NSString *> *result) {
        weakSelf.btnLoadMore.hidden = NO;
        
        if (err != nil) {
            return;
        }
        
        if (_items == nil) {
            _items = [NSMutableArray new];
        }
        
        [_items addObjectsFromArray:result];
        [weakSelf.tvItems reloadData];
        _currentPage += 1;
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tvItems setDataSource:self];
    [self.tvItems setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = _items[indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *parentName = _items[indexPath.row];
    ParentDetailsViewController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"ParentDetailsController"];
    
    destination.parentTouristSite = parentName;
    
    [self.navigationController pushViewController:destination animated:YES];
}

- (IBAction)btnLoadMoreTap:(id)sender {
    __weak OfficialTouristSitesViewController *weakSelf = self;
    
    TMTouristSitesServices *touristSites = [[TMTouristSitesServices alloc] init];
    [touristSites getParentTouristSitesNamesForPage: &(_currentPage) andBlock:^(NSError *err, NSArray<NSString *> *result) {
        if (_items == nil) {
            _items = [NSMutableArray new];
        }
        
        [_items addObjectsFromArray:result];
        
        [weakSelf.tvItems reloadData];
        
        _currentPage += 1;
    }];
}
@end
