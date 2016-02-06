//
//  TMParentTouristSiteRequestModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface TMParentTouristSiteRequestModel : JSONModel
@property (strong, nonatomic) NSString *Name;
@property (strong, nonatomic) NSString *Description;
@property NSInteger Type;
@end
