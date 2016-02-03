//
//  TMSQLiteDatabaseHandler.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMSQLiteDatabaseHandler.h"
#import "TMTouristSiteContracts.h"
#import "TMParentTouristSiteContracts.h"
#import "TMConstants.h"
#import "FMDB.h"

@implementation TMSQLiteDatabaseHandler

-(instancetype)init{
    if (self = [super init]) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        self.databasePath = [documentsDirectory stringByAppendingPathComponent:@"bgtouristguide.sqlite"];
    }
    
    return self;
}

-(void) createDatabase{
    NSString *hasDatabase = [[NSUserDefaults standardUserDefaults] valueForKey:HAS_DATABASE_KEY];
    
    if (hasDatabase.length) {
        return;
    }
    
    FMDatabase *db = [FMDatabase databaseWithPath:self.databasePath];
    
    if (![db open]) {
        [db close];
        return;
    }
    
    NSString * createTableParentTouristSites = [NSString stringWithFormat:@"CREATE TABLE %@(%@ INTEGER PRIMARY KEY NOT NULL, %@ TEXT, %@ TEXT, %@ INTEGER);", [TMParentTouristSiteContracts tableName], [TMParentTouristSiteContracts columnId],[TMParentTouristSiteContracts columnName], [TMParentTouristSiteContracts columnDescription], [TMParentTouristSiteContracts columnType]];
    
    NSString * createTableTouristSites = [NSString stringWithFormat:@"CREATE TABLE %@(%@ INTEGER PRIMARY KEY NOT NULL, %@ TEXT, %@ TEXT, %@ INTEGER, %@ REAL, %@ REAL, %@ INTEGER, FOREIGN KEY(%@) REFERENCES %@(%@));", [TMTouristSiteContracts tableName], [TMTouristSiteContracts columnId],[TMTouristSiteContracts columnName], [TMTouristSiteContracts columnDescription], [TMTouristSiteContracts columnStatus], [TMTouristSiteContracts columnLatitude], [TMTouristSiteContracts columnLongitude], [TMTouristSiteContracts columnParentTouristSideId], [TMTouristSiteContracts columnParentTouristSideId], [TMParentTouristSiteContracts tableName], [TMParentTouristSiteContracts columnId]];
    
    BOOL resultFromCreatingParentTouristSitesTable = [db executeUpdate:createTableParentTouristSites];
    BOOL resultFromCreatingTouristSitesTable = [db executeUpdate:createTableTouristSites];
    
    if (resultFromCreatingParentTouristSitesTable == NO || resultFromCreatingTouristSitesTable == NO) {
        [db close];
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:HAS_DATABASE_KEY];
}

-(BOOL)addParentTouristSite:(TMParentTouristSiteModel *)parentTouristSite{
    FMDatabase *db = [FMDatabase databaseWithPath:self.databasePath];
    
    if (![db open]) {
        [db close];
        return NO;
    }
    
   BOOL hasSuccessfullyAddedParentTouristSite = [db executeUpdate:[NSString stringWithFormat:@"INSERT INTO %@ (%@, %@, %@) VALUES (?, ?, ?)", [TMParentTouristSiteContracts tableName], [TMParentTouristSiteContracts columnName], [TMParentTouristSiteContracts columnDescription], [TMParentTouristSiteContracts columnType]] values:@[parentTouristSite.name, parentTouristSite.modelDescription, @(parentTouristSite.type)] error:nil];
    
    [db close];
    return hasSuccessfullyAddedParentTouristSite;
}

-(BOOL)batchAddParentTouristSites:(NSArray *)parentTouristSites{
    FMDatabase *db = [FMDatabase databaseWithPath:self.databasePath];
    
    if (![db open]) {
        [db close];
        return NO;
    }
    
    NSMutableString *query = [NSMutableString new];
    for (TMParentTouristSiteModel *parentTouristSite in parentTouristSites) {
        [query appendString:[NSString stringWithFormat:@"INSERT INTO %@ (%@, %@, %@) VALUES ('%@', '%@', '%@');", [TMParentTouristSiteContracts tableName], [TMParentTouristSiteContracts columnName], [TMParentTouristSiteContracts columnDescription], [TMParentTouristSiteContracts columnType], parentTouristSite.name, parentTouristSite.modelDescription, @(parentTouristSite.type)]];
    }
    
    BOOL hasSuccessfullyAddedParentTouristSites = [db executeStatements:query];
    
    [db close];
    return hasSuccessfullyAddedParentTouristSites;
}

-(NSArray *)getAllParentTouristSitesNames{
    FMDatabase *db = [FMDatabase databaseWithPath:self.databasePath];
    
    if (![db open]) {
        [db close];
        return nil;
    }
    
    FMResultSet *result = [db executeQuery:[NSString stringWithFormat:@"SELECT %@ FROM %@", [TMParentTouristSiteContracts columnName], [TMParentTouristSiteContracts tableName]]];
    
    NSMutableArray *names = [NSMutableArray new];
    while([result next] == YES){
        NSString *name = [result stringForColumn:[TMParentTouristSiteContracts columnName]];
        [names addObject:name];
    }
    
    [db close];
    
    return names;
}

+(TMSQLiteDatabaseHandler *)sqliteDatabaseHandler{
    return [[TMSQLiteDatabaseHandler alloc] init];
}
@end
