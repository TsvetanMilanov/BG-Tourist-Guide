//
//  TMTouristSiteResponseModel.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMTouristSiteResponseModel.h"

@implementation TMTouristSiteResponseModel

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"Id": @"modelId",
                                                       @"Name": @"name",
                                                       @"Description": @"modelDescription",
                                                       @"Status": @"status",
                                                       @"Latitude": @"latitude",
                                                       @"Longitude": @"longitude",
                                                       @"Address": @"address",
                                                       @"Rating": @"rating"
                                                       }];
}
@end
