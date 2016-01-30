//
//  UserRegisterRequestModel.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "UserRegisterRequestModel.h"

@implementation UserRegisterRequestModel
-(instancetype)initWithEmail:(NSString *)email username:(NSString *)username password:(NSString *)password andConfirmPassword:(NSString *)confirmPassword{
    if (self = [super init]) {
        self.email = email;
        self.username = username;
        self.password = password;
        self.confirmPassword = confirmPassword;
    }
    
    return self;
}

-(instancetype)initWithEmail:(NSString *)email username:(NSString *)username firstName:(NSString *)firstName lastName:(NSString *)lastName password:(NSString *)password andConfirmPassword:(NSString *)confirmPassword {
    if (self = [self initWithEmail:email username:username password:password andConfirmPassword:confirmPassword]) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    return self;
}

+(UserRegisterRequestModel *)userRegisterRequestModelWithEmail:(NSString *)email username:(NSString *)username password:(NSString *)password andConfirmPassword:(NSString *)confirmPassword{
    return [[UserRegisterRequestModel alloc] initWithEmail:email username:username password:password andConfirmPassword:confirmPassword];
}

+(UserRegisterRequestModel *)userRegisterRequestModelWithEmail:(NSString *)email username:(NSString *)username firstName:(NSString *)firstName lastName:(NSString *)lastName password:(NSString *)password andConfirmPassword:(NSString *)confirmPassword{
    return [[UserRegisterRequestModel alloc] initWithEmail:email username:username firstName:firstName lastName:lastName password:password andConfirmPassword:confirmPassword];
}
@end
