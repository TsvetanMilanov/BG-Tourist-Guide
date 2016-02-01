//
//  UserRegisterRequestModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMUserRegisterRequestModel : NSObject
@property NSString *email;
@property NSString *username;
@property NSString *firstName;
@property NSString *lastName;
@property NSString *password;
@property NSString *confirmPassword;

-(instancetype)initWithEmail: (NSString*) email
                    username: (NSString*) username
                    password: (NSString*) password
          andConfirmPassword:  (NSString*) confirmPassword;
-(instancetype)initWithEmail: (NSString *) email
                    username: (NSString *) username
                   firstName: (NSString*) firstName
                    lastName: (NSString*) lastName
                    password: (NSString *) password
          andConfirmPassword: (NSString *) confirmPassword;

+(TMUserRegisterRequestModel*) userRegisterRequestModelWithEmail: (NSString*) email
                                                      username: (NSString*) username
                                                      password: (NSString*) password
                                            andConfirmPassword:  (NSString*) confirmPassword;

+(TMUserRegisterRequestModel*) userRegisterRequestModelWithEmail: (NSString *) email
                                                      username: (NSString *) username
                                                     firstName: (NSString*) firstName
                                                      lastName: (NSString*) lastName
                                                      password: (NSString *) password
                                            andConfirmPassword: (NSString *) confirmPassword;

@end
