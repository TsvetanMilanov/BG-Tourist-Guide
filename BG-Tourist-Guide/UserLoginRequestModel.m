//
//  UserLoginRequestModel.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "UserLoginRequestModel.h"

@implementation UserLoginRequestModel
-(instancetype)initWithUsername:(NSString *)username andPassword:(NSString *)password{
    if (self = [super init]) {
        self.username = username;
        self.password = password;
    }
    
    return self;
}

+(UserLoginRequestModel *)userLoginRequestModelWithUsername:(NSString *)username andPassword:(NSString *)password{
    return [[UserLoginRequestModel alloc] initWithUsername:username andPassword:password];
}
@end
