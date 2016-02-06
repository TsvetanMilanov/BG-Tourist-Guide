//
//  UserLoginRequestModel.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMUserLoginRequestModel.h"

@implementation TMUserLoginRequestModel
-(instancetype)initWithUsername:(NSString *)username andPassword:(NSString *)password{
    if (self = [super init]) {
        self.username = username;
        self.password = password;
        self.grant_type = @"password";
    }
    
    return self;
}

+(TMUserLoginRequestModel *)userLoginRequestModelWithUsername:(NSString *)username andPassword:(NSString *)password{
    return [[TMUserLoginRequestModel alloc] initWithUsername:username andPassword:password];
}
@end
