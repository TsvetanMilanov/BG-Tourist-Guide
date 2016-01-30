//
//  UserLoginRequestModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLoginRequestModel : NSObject
@property NSString *username;
@property NSString *password;

-(instancetype)initWithUsername: (NSString*) username
                    andPassword: (NSString*) password;

+(UserLoginRequestModel*) userLoginRequestModelWithUsername: (NSString*) username
                                                andPassword: (NSString*) password;
@end
