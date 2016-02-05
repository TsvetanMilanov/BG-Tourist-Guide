//
//  TMParentTouristSiteContracts.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMParentTouristSiteContracts.h"

@implementation TMParentTouristSiteContracts

+(NSString *)columnId {
    return @"_id";
}

+(NSString *)tableName{
    return @"ParentTouristSites";
}

+(NSString *)columnName{
    return @"name";
}

+(NSString *)columnDescription{
    return @"description";
}

+(NSString *)columnType{
    return @"type";
}

@end
