//
//  ProfileResponseModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "TMTouristSiteResponseModel.h"
#import "TMBadgeResponseModel.h"

@interface TMProfileResponseModel : JSONModel
@property (strong, nonatomic) NSString *UserName;
@property (strong, nonatomic) NSString *FirstName;
@property (strong, nonatomic) NSString *LastName;
@property (strong, nonatomic) NSDate *RegistrationDate;
@property (strong, nonatomic) NSArray<TMBadgeResponseModel*> *Badges;
@property (strong, nonatomic) NSArray<TMTouristSiteResponseModel*> *VisitedTouristSites;
@end
