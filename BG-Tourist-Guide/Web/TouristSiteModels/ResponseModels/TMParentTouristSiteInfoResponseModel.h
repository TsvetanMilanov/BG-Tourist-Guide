//
//  TMParentTouristSiteInfoResponseModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "TMTouristSiteResponseModel.h"

@interface TMParentTouristSiteInfoResponseModel : JSONModel
@property NSInteger modelId;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* modelDescription;
@property (strong, nonatomic) NSArray<TMTouristSiteResponseModel*> *subTouristSites;
@end
