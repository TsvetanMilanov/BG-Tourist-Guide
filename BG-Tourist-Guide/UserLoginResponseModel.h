//
//  UserLoginResponseModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface UserLoginResponseModel : JSONModel
@property NSString* access_token;
@property NSString* userName;
@end
