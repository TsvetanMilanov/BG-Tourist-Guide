//
//  TMTouristSitesServices.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMTouristSitesServices.h"
#import "TMRequester.h"

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

-(void) getParentTouristSitesNamesForPage: (NSInteger*) page andBlock: (void(^)(NSError*, NSArray<TMSimpleParentTouristSiteResponseModel*>*)) block{
    [_requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Parents/Simple?page=%@&type=%i", [NSNumber numberWithInteger:*page], 0] andBlock:^(NSError *err, id result) {
        NSMutableArray *mappedResult = [NSMutableArray new];
        
        for (NSDictionary *item in result) {
            TMSimpleParentTouristSiteResponseModel *currentParentTouristSite = [[TMSimpleParentTouristSiteResponseModel alloc] initWithDictionary:item error:nil];
            
            [mappedResult addObject: currentParentTouristSite];
        }
        
        block(err, mappedResult);
    }];
}

@end
