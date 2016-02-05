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
#import "TMSimpleParentTouristSiteResponseModel.h"

@interface OfficialTouristSitesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tvItems;

@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;

- (IBAction)btnLoadMoreTap:(id)sender;

@end

@implementation OfficialTouristSitesViewController
{
    NSMutableArray *_items;
    NSInteger _currentPage;
    NSInteger _type;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _currentPage = 1;
    __weak OfficialTouristSitesViewController *weakSelf = self;
    
    TMTouristSitesServices *touristSites = [[TMTouristSitesServices alloc] init];
    [touristSites getParentTouristSitesForPage:&(_currentPage) type:&(_type) andBlock:^(NSError *err, NSArray<TMSimpleParentTouristSiteResponseModel *> *result) {
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = ((TMSimpleParentTouristSiteResponseModel*)_items[indexPath.row]).name;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _items.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ParentDetailsViewController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"ParentDetailsController"];
    
    TMSimpleParentTouristSiteResponseModel *parent = (TMSimpleParentTouristSiteResponseModel*)_items[indexPath.row];
    
    destination.parentTouristSite = parent;
    
    [self.navigationController pushViewController:destination animated:YES];
}

- (IBAction)btnLoadMoreTap:(id)sender {
    __weak OfficialTouristSitesViewController *weakSelf = self;
    
    TMTouristSitesServices *touristSites = [[TMTouristSitesServices alloc] init];
    [touristSites getParentTouristSitesForPage: &(_currentPage) type: &(_type) andBlock:^(NSError *err, NSArray<NSString *> *result) {
        if (_items == nil) {
            _items = [NSMutableArray new];
        }
        
        [_items addObjectsFromArray:result];
        
        [weakSelf.tvItems reloadData];
        
        _currentPage += 1;
    }];
}
@end
