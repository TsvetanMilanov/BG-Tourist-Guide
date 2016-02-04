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

-(void) getParentTouristSitesNamesForPage: (NSInteger*) page andBlock: (void(^)(NSError*, NSArray<NSString*>*)) block{
    [_requester getJSONWithUrl:[NSString stringWithFormat:@"/api/TouristSites/Parents/Names?page=%@", [NSNumber numberWithInteger:*page]] andBlock:^(NSError *err, id result) {
            block(err, result);
    }];
}

@end
