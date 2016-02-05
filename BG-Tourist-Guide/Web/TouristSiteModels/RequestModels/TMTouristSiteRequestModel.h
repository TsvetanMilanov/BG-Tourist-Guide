//
//  TMTouristSiteRequestModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TMTouristSiteRequestModel : JSONModel
@property (strong, nonatomic) NSString *Name;
@property (strong, nonatomic) NSString *Description;
@property (strong, nonatomic) NSString *Address;
@property double Latitude;
@property double Longitude;
@property NSInteger ParentTouristSiteId;
@property NSInteger Status;
@end
