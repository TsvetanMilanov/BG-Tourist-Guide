//
//  UserLoginRequestModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface UserLoginRequestModel : JSONModel
@property NSString *username;
@property NSString *password;
@property NSString *grant_type;

-(instancetype)initWithUsername: (NSString*) username
                    andPassword: (NSString*) password;

+(UserLoginRequestModel*) userLoginRequestModelWithUsername: (NSString*) username
                                                andPassword: (NSString*) password;
@end
