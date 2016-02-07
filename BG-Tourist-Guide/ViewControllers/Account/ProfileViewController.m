//
//  ProfileViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "ProfileViewController.h"
#import "TMProfileResponseModel.h"
#import "TMTouristSiteResponseModel.h"
#import "TMAccountServices.h"
#import "TMActivityIndicatorFactory.h"
#import "TMAlertControllerFactory.h"
#import "TMTableViewBadgesDelegate.h"
#import "TMTableViewTouristSitesDelegate.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lbLastName;
@property (weak, nonatomic) IBOutlet UILabel *lbRegistrationDate;
@property (weak, nonatomic) IBOutlet UITableView *tvBadges;
@property (weak, nonatomic) IBOutlet UITableView *tvVisitedTouristSites;

@end

@implementation ProfileViewController
{
    NSMutableArray<TMTouristSiteResponseModel*> *_visitedTouristSites;
    NSMutableArray<NSString*> *_badges;
    TMAccountServices *_account;
    TMTableViewBadgesDelegate *_badgesDelegate;
    TMTableViewTouristSitesDelegate *_touristSitesDelegate;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _visitedTouristSites = [NSMutableArray new];
    _badges = [NSMutableArray new];
    _account = [[TMAccountServices alloc] init];
}

-(void)viewWillAppear:(BOOL)animated {
    _badgesDelegate = [[TMTableViewBadgesDelegate alloc] initWithItems: [NSArray new]];
    
    self.tvBadges.delegate = _badgesDelegate;
    self.tvBadges.dataSource = _badgesDelegate;
    
    _touristSitesDelegate = [[TMTableViewTouristSitesDelegate alloc] initWithController:self];
    
    self.tvVisitedTouristSites.delegate = _touristSitesDelegate;
    self.tvVisitedTouristSites.dataSource = _touristSitesDelegate;
    
    [self loadData];
}

-(void) loadData{
    __weak ProfileViewController *weakSelf = self;
    __weak UIActivityIndicatorView *loading = [TMActivityIndicatorFactory activityIndicatorWithParentView:self.view];
    
    [loading startAnimating];
    
    [_account getProfileInformationWithBlock:^(NSError *err, TMProfileResponseModel *result) {
        [loading stopAnimating];
        
        if (err != nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot load the information for your profile. Please try again later." uiViewController:self andHandler:nil];
            return;
        }
        
        weakSelf.navigationItem.title = result.UserName;
        
        weakSelf.lbFirstName.text = [NSString stringWithFormat:@"First name: %@", result.FirstName.length == 0 ? @"Empty" : result.FirstName];
        weakSelf.lbLastName.text = [NSString stringWithFormat:@"Last name: %@", result.LastName.length == 0 ? @"Empty" : result.LastName];
        weakSelf.lbRegistrationDate.text = [NSString stringWithFormat:@"Registration date: %@", result.RegistrationDate];
        
        _badgesDelegate.items = result.Badges;
        
        _touristSitesDelegate.items = result.VisitedTouristSites;
        
        [weakSelf.tvBadges reloadData];
        
        [weakSelf.tvVisitedTouristSites reloadData];
    }];
}

@end
