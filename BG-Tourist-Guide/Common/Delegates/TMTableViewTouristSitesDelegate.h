//
//  TMTableViewTouristSitesDelegate.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TMTouristSiteResponseModel.h"

@interface TMTableViewTouristSitesDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray<TMTouristSiteResponseModel*>* items;
@property (strong, nonatomic) UIViewController* controller;

-(instancetype)initWithController: (UIViewController*) controller;
@end
