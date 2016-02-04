//
//  TMTouristSitesServices.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMParentTouristSiteResponseModel.h"

@interface TMTouristSitesServices : NSObject

-(instancetype)init;

-(void) getParentTouristSitesNamesForPage: (NSInteger*) page andBlock: (void(^)(NSError *err, NSArray<NSString*> *result)) block;
@end
