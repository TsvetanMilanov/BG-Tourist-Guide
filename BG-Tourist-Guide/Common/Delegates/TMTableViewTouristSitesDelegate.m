//
//  TMTableViewTouristSitesDelegate.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMTableViewTouristSitesDelegate.h"
#import "TouristSiteDetailsViewController.h"

@implementation TMTableViewTouristSitesDelegate
-(instancetype)initWithController: (UIViewController*) controller {
    if (self = [super init]) {
        self.items = [NSMutableArray new];
        self.controller = controller;
    }
    
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellIdentifier"];
    }
    
    cell.textLabel.text = self.items[indexPath.row].name;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TouristSiteDetailsViewController *destination = [self.controller.storyboard instantiateViewControllerWithIdentifier:@"TouristSiteDetailsScene"];
    
    TMTouristSiteResponseModel *touristSite = (TMTouristSiteResponseModel*)self.items[indexPath.row];
    
    destination.touristSite = touristSite;
    
    [self.controller.navigationController pushViewController:destination animated:YES];
}

@end
