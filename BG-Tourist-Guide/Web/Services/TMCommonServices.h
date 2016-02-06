//
//  TMCommonServices.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBaseService.h"
#import "TMScoreboardResponseModel.h"

@interface TMCommonServices : TMBaseService

-(void) getScoreboardWithBlock: (void(^)(NSError* err, NSMutableArray<TMScoreboardResponseModel*> *result)) block;

@end
