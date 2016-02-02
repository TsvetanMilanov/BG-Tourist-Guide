//
//  TMParentTouristSiteModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMParentTouristSiteModel : NSObject
@property NSInteger modelId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *modelDescription;
@property NSInteger type;
@end
