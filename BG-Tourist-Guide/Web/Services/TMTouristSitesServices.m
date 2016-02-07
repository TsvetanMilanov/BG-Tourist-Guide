//
//  TMTouristSitesServices.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMTouristSitesServices.h"
#import "TMSimpleTouristSiteResponseModel.h"

@implementation TMTouristSitesServices

-(void) getParentTouristSitesForPage: (NSInteger) page type: (NSInteger) type andBlock: (void(^)(NSError*, NSArray<TMSimpleParentTouristSiteResponseModel*>*)) block {
    [self.requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Parents/Simple?page=%@&type=%ld", [NSNumber numberWithInteger: page], (long)type] andBlock:^(NSError *err, id result) {
        NSMutableArray *mappedResult = [NSMutableArray new];
        
        for (NSDictionary *item in result) {
            TMSimpleParentTouristSiteResponseModel *currentParentTouristSite = [[TMSimpleParentTouristSiteResponseModel alloc] initWithDictionary:item error:nil];
            
            [mappedResult addObject: currentParentTouristSite];
        }
        
        block(err, mappedResult);
    }];
}

-(void) getParentTouristSiteInfoById: (NSInteger) modelId andBlock: (void(^)(NSError* err, TMParentTouristSiteInfoResponseModel* result)) block {
    [self.requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Parents?id=%ld", (long) modelId] andBlock:^(NSError * err, id result) {
        TMParentTouristSiteInfoResponseModel *mappedResponse = [[TMParentTouristSiteInfoResponseModel alloc] initWithDictionary:result error:nil];
        
        NSMutableArray *subTouristSitesArray = [NSMutableArray new];
        
        for (id item in mappedResponse.subTouristSites) {
            [subTouristSitesArray addObject:[[TMTouristSiteResponseModel alloc] initWithDictionary: item error: nil]];
        }
        
        mappedResponse.subTouristSites = [NSArray arrayWithArray: subTouristSitesArray];
        
        block(err, mappedResponse);
    }];
}


-(void) getTouristSitesNearMeForPage: (NSInteger) page andBlock: (void(^)(NSError *err, NSArray<TMTouristSiteResponseModel*> *result)) block {
    double latitude = 0;
    double longitude = 0;
    
    [self.requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/NearMe?latitude=%f&longitude=%f&page=%ld", latitude, longitude, (long)page] andBlock:^(NSError *err, id result) {
        NSMutableArray<TMTouristSiteResponseModel*> *mappedResult = [NSMutableArray new];
        
        for (id item in result) {
            [mappedResult addObject:[[TMTouristSiteResponseModel alloc] initWithDictionary: item error: nil]];
        }
        
        block(err, mappedResult);
    }];
}

-(void) getTouristSitesForRate: (NSInteger) page andBlock: (void(^)(NSError *err, NSArray<TMTouristSiteResponseModel*> *result)) block {
    [self.requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/ForRating?page=%ld", (long)page] andBlock:^(NSError *err, id result) {
        NSMutableArray<TMTouristSiteResponseModel*> *mappedResult = [NSMutableArray new];
        
        for (id item in result) {
            [mappedResult addObject:[[TMTouristSiteResponseModel alloc] initWithDictionary: item error: nil]];
        }
        
        block(err, mappedResult);
    }];
}

-(void) addParentTouristSite: (TMParentTouristSiteRequestModel*) model andBlock: (void(^)(NSError* err, TMSimpleParentTouristSiteResponseModel *result)) block {
    [self.requester postJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Parents"] data: [model toJSONString] andBlock:^(NSError *err, id result) {
        if (err != nil) {
            block(err, nil);
            return;
        }
        
        TMSimpleParentTouristSiteResponseModel * mappedResult = [[TMSimpleParentTouristSiteResponseModel alloc] initWithDictionary:result error:nil];
        
        block(err, mappedResult);
    }];
}

-(void) addTouristSite: (TMTouristSiteRequestModel*) model andBlock: (void(^)(NSError* err, TMSimpleTouristSiteResponseModel *result)) block {
    [self.requester postJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites"] data: [model toJSONString] andBlock:^(NSError *err, id result) {
        if (err != nil) {
            block(err, nil);
            return;
        }
        
        TMSimpleTouristSiteResponseModel * mappedResult = [[TMSimpleTouristSiteResponseModel alloc] initWithDictionary:result error:nil];
        
        block(err, mappedResult);
    }];
}

-(void) visitTouristSite: (NSInteger) touristSiteId andBlock: (void(^)(NSError *err)) block {
    [self.requester postJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Visit?id=%ld", touristSiteId] data:nil andBlock:^(NSError *err, id result) {
        if (err != nil) {
            block(err);
            return;
        }
        
        block(nil);
    }];
}

-(void) rateTouristSiteWithId: (NSInteger) touristSiteId rating:(NSInteger) rating andBlock: (void(^)(NSError *err)) block {
    [self.requester postJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Rate/%ld?rating=%ld", touristSiteId, rating] data:nil andBlock:^(NSError *err, id result) {
        if (err != nil) {
            block(err);
            return;
        }
        
        block(nil);
    }];
}

@end
