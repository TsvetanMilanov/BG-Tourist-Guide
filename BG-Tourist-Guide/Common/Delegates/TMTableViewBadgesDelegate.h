//
//  TMTableViewBadgesDelegate.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TMBadgeResponseModel.h"

@interface TMTableViewBadgesDelegate : NSObject<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray<TMBadgeResponseModel*>* items;

-(instancetype)initWithItems: (NSArray<TMBadgeResponseModel*>*) items;
@end
