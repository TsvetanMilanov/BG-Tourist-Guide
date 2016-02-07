//
//  RateViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "RateViewController.h"
#import "TouristSiteDetailsViewController.h"
#import "TMTouristSitesServices.h"
#import "TMAlertControllerFactory.h"
#import "TMActivityIndicatorFactory.h"

@interface RateViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tvItems;
@end

@implementation RateViewController
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
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
    
    self.tabBarController.navigationItem.title = @"Rate";
    self.tvItems.delegate = self;
    self.tvItems.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    TMTouristSiteResponseModel *item = _items[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ -> %@ / 10", item.name, item.rating];
    
    if (indexPath.row >= _items.count - 1 && _items.count > 0 && _hasMoreItems == YES) {
        [self loadData];
    }
    
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(navigateToTouristSiteDetailsScene:)];
    
    [self.tvItems addGestureRecognizer: longPressGestureRecognizer];
    
    return cell;
}

-(void) navigateToTouristSiteDetailsScene: (UILongPressGestureRecognizer*) sender {
    TouristSiteDetailsViewController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"TouristSiteDetailsScene"];
    
    CGPoint p = [sender locationInView:self.tvItems];
    
    NSIndexPath *indexPath = [self.tvItems indexPathForRowAtPoint:p];
    if (sender.state == UIGestureRecognizerStateRecognized) {
        
        TMTouristSiteResponseModel *touristSite = _items[indexPath.row];
        
        destination.touristSite = touristSite;
        
        [self.navigationController pushViewController:destination animated:YES];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak RateViewController *weakSelf = self;
    TMTouristSiteResponseModel *item = _items[indexPath.row];
    
    [TMAlertControllerFactory showTextInputDialogWithTitle:@"Enter rating" controller:self andHandler:^(NSString * _Nonnull text) {
        __weak UIActivityIndicatorView *loadingBar = [TMActivityIndicatorFactory activityIndicatorWithParentView: weakSelf.view];
        [loadingBar startAnimating];
        
        [_touristSites rateTouristSiteWithId: item.modelId rating:[text integerValue] andBlock:^(NSError *err) {
            [loadingBar stopAnimating];
            
            if (err != nil) {
                [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot rate this tourist site. Please try again later." uiViewController:weakSelf andHandler:nil];
                return;
            }
            
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"Tourist site rated." uiViewController:weakSelf andHandler:^(UIAlertAction * _Nonnull action) {
                [weakSelf loadData];
                [weakSelf.tvItems reloadData];
            }];
        }];
    }];
}

-(void) loadData{
    __weak RateViewController *weakSelf = self;
    __weak UIActivityIndicatorView *loading = [TMActivityIndicatorFactory activityIndicatorWithParentView:self.view];
    
    [loading startAnimating];
    
    [_touristSites getTouristSitesForRate:_currentPage andBlock:^(NSError *err, NSArray<TMTouristSiteResponseModel *> *result) {
        [loading stopAnimating];
        
        if (err != nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot load the tourist sites to rate. Please try again later." uiViewController:weakSelf andHandler:nil];
            
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
