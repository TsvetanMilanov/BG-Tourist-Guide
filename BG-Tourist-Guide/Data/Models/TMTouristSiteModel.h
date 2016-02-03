//
//  TMTouristSiteModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMTouristSiteModel : NSObject
@property NSInteger modelId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *modelDescription;
@property NSInteger latitude;
@property NSInteger longitude;
@property NSInteger status;
@property (strong, nonatomic) NSString *address;
@property NSInteger rating;
@property NSInteger parentTouristSiteId;
@end
