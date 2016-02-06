//
//  TMSimpleParentTouristSiteResponseModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TMSimpleParentTouristSiteResponseModel : JSONModel
@property NSInteger modelId;
@property (strong, nonatomic) NSString* name;
@end
