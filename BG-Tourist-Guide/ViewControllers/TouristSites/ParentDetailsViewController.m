//
//  ParentDetailsViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "ParentDetailsViewController.h"
#import "TouristSiteDetailsViewController.h"
#import "TMTouristSitesServices.h"
#import "TMParentTouristSiteInfoResponseModel.h"
#import "TMTouristSiteResponseModel.h"
#import "TMAlertControllerFactory.h"

@interface ParentDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UITableView *tableSubTouristSites;
@end

@implementation ParentDetailsViewController
{
    TMParentTouristSiteInfoResponseModel *_responseParent;
    TMTouristSitesServices *_touristSites;
    NSArray<TMTouristSiteResponseModel*> *_subtouristSites;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder: aDecoder]) {
        _touristSites = [[TMTouristSitesServices alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.parentTouristSite.name;
    __weak ParentDetailsViewController *weakSelf = self;
    
    [_touristSites getParentTouristSiteInfoById:self.parentTouristSite.modelId andBlock:^(NSError *err, TMParentTouristSiteInfoResponseModel *response) {
        if (err != nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:[NSString stringWithFormat:@"Cannot load the information for %@ from the server. Please try agin later.", weakSelf.parentTouristSite.name ] uiViewController:self andHandler:nil];
        }
        
        _responseParent = response;
        self.tvDescription.text = _responseParent.modelDescription;
        _subtouristSites = _responseParent.subTouristSites;
        [self.tableSubTouristSites reloadData];
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    self.tableSubTouristSites.delegate = self;
    self.tableSubTouristSites.dataSource = self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    TMTouristSiteResponseModel *item = _subtouristSites[indexPath.row];
    
    cell.textLabel.text = item.name;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _subtouristSites.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TouristSiteDetailsViewController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"TouristSiteDetailsScene"];
    
    TMTouristSiteResponseModel *touristSite = (TMTouristSiteResponseModel*)_subtouristSites[indexPath.row];
    
    destination.touristSite = touristSite;
    
    [self.navigationController pushViewController:destination animated:YES];
}

@end
