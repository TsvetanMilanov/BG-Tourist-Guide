//
//  TMParentTouristSiteInfoResponseModel.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMParentTouristSiteInfoResponseModel.h"

@implementation TMParentTouristSiteInfoResponseModel
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"Id": @"modelId",
                                                       @"Name": @"name",
                                                       @"Description": @"modelDescription",
                                                       @"SubTouristSites": @"subTouristSites"
                                                       }];
}
@end