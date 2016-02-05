//
//  TMTouristSitesServices.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMParentTouristSiteResponseModel.h"
#import "TMSimpleParentTouristSiteResponseModel.h"
#import "TMParentTouristSiteInfoResponseModel.h"

@interface TMTouristSitesServices : NSObject

-(instancetype)init;

-(void) getParentTouristSitesForPage: (NSInteger*) page type: (NSInteger*) type andBlock: (void(^)(NSError *err, NSArray<TMSimpleParentTouristSiteResponseModel*> *result)) block;

-(void) getParentTouristSiteInfoById: (NSInteger) modelId andBlock: (void(^)(NSError* err, TMParentTouristSiteInfoResponseModel* result)) block;
@end