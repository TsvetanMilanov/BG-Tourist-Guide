//
//  NearMeViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/5/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "NearMeViewController.h"
#import "TouristSiteDetailsViewController.h"
#import "TMTouristSiteResponseModel.h"
#import "TMTouristSitesServices.h"
#import "TMAlertControllerFactory.h"
#import "TMActivityIndicatorFactory.h"

@interface NearMeViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tvTouristSites;

@end

@implementation NearMeViewController
{
    NSMutableArray<TMTouristSiteResponseModel*> *_items;
    NSInteger _currentPage;
    TMTouristSitesServices *_touristSites;
    BOOL _hasMoreItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _items = [NSMutableArray new];
    _currentPage = 1;
    _hasMoreItems = YES;
    
    _touristSites = [[TMTouristSitesServices alloc] init];
    
    [self loadData];
}

-(void)viewWillAppear:(BOOL)animated {
    self.tvTouristSites.delegate = self;
    self.tvTouristSites.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = _items[indexPath.row].name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row >= _items.count - 1 && _items.count > 0 && _hasMoreItems == YES) {
        [self loadData];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TouristSiteDetailsViewController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"TouristSiteDetailsScene"];
    
    TMTouristSiteResponseModel *touristSite = _items[indexPath.row];
    
    destination.touristSite = touristSite;
    
    [self.navigationController pushViewController:destination animated:YES];

}

-(void) loadData{
    __weak NearMeViewController *weakSelf = self;
    __weak UIActivityIndicatorView *loading = [TMActivityIndicatorFactory activityIndicatorWithParentView:self.view];
    
    [loading startAnimating];
    
    [_touristSites getTouristSitesNearMeForPage:_currentPage andBlock:^(NSError *err, NSArray<TMTouristSiteResponseModel *> *result) {
        [loading stopAnimating];
        
        if (err != nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot load the tourist sites near you. Please try again later." uiViewController:weakSelf andHandler:nil];
            
            return;
        }
        
        if (result.count == 0) {
            _hasMoreItems = NO;
            return;
        }
        
        _currentPage += 1;
        
        [_items addObjectsFromArray:result];
        [weakSelf.tvTouristSites reloadData];
    }];
}

@end
