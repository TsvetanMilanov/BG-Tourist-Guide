//
//  UserRegisterRequestModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface TMUserRegisterRequestModel : JSONModel
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *confirmPassword;

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
