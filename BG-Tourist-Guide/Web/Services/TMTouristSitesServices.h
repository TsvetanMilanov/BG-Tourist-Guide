//
//  TMTouristSitesServices.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMBaseService.h"
#import "TMParentTouristSiteResponseModel.h"
#import "TMSimpleParentTouristSiteResponseModel.h"
#import "TMParentTouristSiteInfoResponseModel.h"
#import "TMSimpleTouristSiteResponseModel.h"
#import "TMParentTouristSiteRequestModel.h"
#import "TMTouristSiteRequestModel.h"

@interface TMTouristSitesServices : TMBaseService

-(void) getParentTouristSitesForPage: (NSInteger) page type: (NSInteger) type andBlock: (void(^)(NSError *err, NSArray<TMSimpleParentTouristSiteResponseModel*> *result)) block;

-(void) getParentTouristSiteInfoById: (NSInteger) modelId andBlock: (void(^)(NSError* err, TMParentTouristSiteInfoResponseModel* result)) block;

-(void) getTouristSitesNearMeForPage: (NSInteger) page andBlock: (void(^)(NSError *err, NSArray<TMTouristSiteResponseModel*> *result)) block;

-(void) addParentTouristSite: (TMParentTouristSiteRequestModel*) model andBlock: (void(^)(NSError* err, TMSimpleParentTouristSiteResponseModel *result)) block;

-(void) addTouristSite: (TMTouristSiteRequestModel*) model andBlock: (void(^)(NSError* err, TMSimpleTouristSiteResponseModel *result)) block;

-(void) getTouristSitesForRate: (NSInteger) page andBlock: (void(^)(NSError *err, NSArray<TMTouristSiteResponseModel*> *result)) block;
@end
