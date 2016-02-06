//
//  TMScoreboardResponseMode.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface TMScoreboardResponseModel : JSONModel
@property (strong, nonatomic) NSString* UserName;
@property double Rating;

@end
