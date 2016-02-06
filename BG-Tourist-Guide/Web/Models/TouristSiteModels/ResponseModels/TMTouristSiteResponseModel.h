//
//  TMTouristSiteResponseModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TMTouristSiteResponseModel : JSONModel
@property NSInteger modelId;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* modelDescription;
@property (strong, nonatomic) NSNumber *latitude;
@property (strong, nonatomic) NSNumber *longitude;
@property (strong, nonatomic) NSString* address;
@property (strong, nonatomic) NSNumber *rating;
@property NSInteger status;
@end
