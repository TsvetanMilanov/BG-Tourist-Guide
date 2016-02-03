//
//  TMSQLiteDatabaseHandler.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMParentTouristSiteModel.h"

@interface TMSQLiteDatabaseHandler : NSObject
@property (strong, nonatomic) NSString *databasePath;

-(instancetype)init;

-(void) createDatabase;

-(BOOL) addParentTouristSite: (TMParentTouristSiteModel*) parentTouristSite;

-(NSArray*) getAllParentTouristSitesNames;

+(TMSQLiteDatabaseHandler*) sqliteDatabaseHandler;
@end
