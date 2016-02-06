//
//  TMCommonServices.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMCommonServices.h"

@implementation TMCommonServices

-(void) getScoreboardWithBlock: (void(^)(NSError* err, NSMutableArray<TMScoreboardResponseModel*> *result)) block {
    [self.requester getJSONWithUrl:@"/api/Scoreboard" andBlock:^(NSError *err, id result) {
        if (err != nil || result == nil) {
            block(err, nil);
            return;
        }
        
        NSMutableArray *mappedResult = [NSMutableArray new];
        
        for (id item in result) {
            TMScoreboardResponseModel *mappedItem = [[TMScoreboardResponseModel alloc] initWithDictionary:item error:nil];
            [mappedResult addObject:mappedItem];
        }
        
        block(nil, mappedResult);
    }];
}

@end
