//
//  TouristSiteDetailsViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/5/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TouristSiteDetailsViewController.h"

@interface TouristSiteDetailsViewController ()

@end

@implementation TouristSiteDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.touristSite.name;
}

@end
