//
//  OfficialTouristSitesViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "OfficialTouristSitesViewController.h"
#import "AddParentTouristSiteViewController.h"
#import "ParentDetailsViewController.h"
#import "TMTouristSitesServices.h"
#import "TMSimpleParentTouristSiteResponseModel.h"
#import "TMAlertControllerFactory.h"
#import "TMActivityIndicatorFactory.h"

@interface OfficialTouristSitesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tvItems;

@property (weak, nonatomic) IBOutlet UIButton *btnLoadMore;

@end

@implementation OfficialTouristSitesViewController
{
    NSMutableArray<TMSimpleParentTouristSiteResponseModel*> *_items;
    NSInteger _currentPage;
    NSInteger _type;
    TMTouristSitesServices *_touristSites;
    BOOL _hasMoreItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _type = 0;
    _currentPage = 1;
    _hasMoreItems = YES;
    _touristSites = [[TMTouristSitesServices alloc] init];
    _items = [NSMutableArray new];
    
    [self loadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *navigateToAddParentTouristSiteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navigateToAddParentTouristSiteScene)];
    
    self.tabBarController.navigationItem.rightBarButtonItem = navigateToAddParentTouristSiteButton;
    
    self.tabBarController.title = @"Official";
    [self.tvItems setDataSource:self];
    [self.tvItems setDelegate:self];
}

-(void) navigateToAddParentTouristSiteScene {
    AddParentTouristSiteViewController *target = [self.storyboard instantiateViewControllerWithIdentifier:@"AddParentController"];
    [self.navigationController pushViewController:target animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = _items[indexPath.row].name;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row >= _items.count - 1 && _items.count > 0 && _hasMoreItems == YES) {
        [self loadData];
    }
    
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

-(void) loadData{
    __weak OfficialTouristSitesViewController *weakSelf = self;
    __weak UIActivityIndicatorView *loading = [TMActivityIndicatorFactory activityIndicatorWithParentView:self.view];
    
    [loading startAnimating];
    
    [_touristSites getParentTouristSitesForPage:(_currentPage) type:(_type) andBlock:^(NSError *err, NSArray<TMSimpleParentTouristSiteResponseModel *> *result) {
        [loading stopAnimating];
        
        if (err != nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot load the information for the official tourist sites from the server. Please try again later." uiViewController:self andHandler:nil];
            return;
        }
        
        if (result.count == 0) {
            _hasMoreItems = NO;
            return;
        }
        
        _currentPage += 1;
        
        [_items addObjectsFromArray:result];
        [weakSelf.tvItems reloadData];
    }];
}

@end
