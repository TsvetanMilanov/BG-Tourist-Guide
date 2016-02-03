//
//  TMTouristSiteContracts.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMTouristSiteContracts.h"

@implementation TMTouristSiteContracts
+(NSString *)tableName{
    return @"TouristSites";
}

+(NSString *)columnId{
    return @"_id";
}

+(NSString *)columnName{
    return @"name";
}

+(NSString *)columnDescription{
    return @"description";
}

+(NSString *)columnStatus{
    return @"status";
}

+(NSString *)columnLatitude{
    return @"latittude";
}

+(NSString *)columnLongitude {
    return @"longitude";
}

+(NSString*)columnParentTouristSideId{
    return @"ParentTouristSiteId";
}

@end
