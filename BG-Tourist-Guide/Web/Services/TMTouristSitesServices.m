//
//  TMTouristSitesServices.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMTouristSitesServices.h"
#import "TMRequester.h"
#import "TMTouristSiteResponseModel.h"

@implementation TMTouristSitesServices
{
    TMRequester *_requester;
}

-(instancetype)init{
    if (self = [super init]) {
        _requester = [[TMRequester alloc] init];
    }
    
    return self;
}

-(void) getParentTouristSitesForPage: (NSInteger*) page type: (NSInteger*) type andBlock: (void(^)(NSError*, NSArray<TMSimpleParentTouristSiteResponseModel*>*)) block {
    [_requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Parents/Simple?page=%@&type=%ld", [NSNumber numberWithInteger:*page], (long)type] andBlock:^(NSError *err, id result) {
        NSMutableArray *mappedResult = [NSMutableArray new];
        
        for (NSDictionary *item in result) {
            TMSimpleParentTouristSiteResponseModel *currentParentTouristSite = [[TMSimpleParentTouristSiteResponseModel alloc] initWithDictionary:item error:nil];
            
            [mappedResult addObject: currentParentTouristSite];
        }
        
        block(err, mappedResult);
    }];
}

-(void) getParentTouristSiteInfoById: (NSInteger) modelId andBlock: (void(^)(NSError* err, TMParentTouristSiteInfoResponseModel* result)) block {
    [_requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Parents?id=%ld", (long) modelId] andBlock:^(NSError * err, id result) {
        TMParentTouristSiteInfoResponseModel *mappedResponse = [[TMParentTouristSiteInfoResponseModel alloc] initWithDictionary:result error:nil];
        
        NSMutableArray *subTouristSitesArray = [NSMutableArray new];
        
        for (id item in mappedResponse.subTouristSites) {
            [subTouristSitesArray addObject:[[TMTouristSiteResponseModel alloc] initWithDictionary: item error: nil]];
        }
        
        mappedResponse.subTouristSites = [NSArray arrayWithArray: subTouristSitesArray];
        
        block(err, mappedResponse);
    }];
}

@end
