//
//  TMTouristSiteContracts.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMTouristSiteContracts : NSObject
+(NSString*) tableName;
+(NSString*) columnId;
+(NSString*) columnName;
+(NSString*) columnDescription;
+(NSString*) columnStatus;
+(NSString*) columnLatitude;
+(NSString*) columnLongitude;
+(NSString*) columnParentTouristSideId;
@end
