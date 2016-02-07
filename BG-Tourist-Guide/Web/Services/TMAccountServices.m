//
//  TMAccountServices.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMAccountServices.h"
#import "TMTouristSiteResponseModel.h"
#import "TMBadgeResponseModel.h"

@implementation TMAccountServices
-(void) getProfileInformationWithBlock: (void(^)(NSError *err, TMProfileResponseModel *result)) block {
    [self.requester getJSONWithUrl:@"/api/Account/Profile" andBlock:^(NSError *err, id result) {
        if (err != nil || result == nil) {
            block(err, nil);
            return;
        }
        
        TMProfileResponseModel *mappedResponse = [[TMProfileResponseModel alloc] initWithDictionary:result error:nil];
        
        NSArray *notMappedTouristSites = [NSArray arrayWithArray: mappedResponse.VisitedTouristSites];
        
        mappedResponse.VisitedTouristSites = [NSMutableArray new];
        NSMutableArray *mappedVisitedTouristSites = [NSMutableArray new];
        
        for (id item in notMappedTouristSites) {
            [mappedVisitedTouristSites addObject: [[TMTouristSiteResponseModel alloc] initWithDictionary: item error: nil]];
        }
        
        NSArray *notMappedBadges = [NSArray arrayWithArray: mappedResponse.Badges];
        
        mappedResponse.Badges = [NSMutableArray new];
        NSMutableArray *mappedBadges = [NSMutableArray new];
        
        for (id item in notMappedBadges) {
            [mappedBadges addObject: [[TMBadgeResponseModel alloc] initWithDictionary: item error: nil]];
        }
        
        mappedResponse.Badges = [NSArray arrayWithArray:mappedBadges];
        
        block(nil, mappedResponse);
    }];
}
@end
