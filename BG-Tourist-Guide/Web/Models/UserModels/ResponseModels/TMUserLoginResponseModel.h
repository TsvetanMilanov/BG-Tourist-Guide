//
//  UserLoginResponseModel.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "JSONModel.h"

@interface TMUserLoginResponseModel : JSONModel
@property (strong, nonatomic) NSString* access_token;
@property (strong, nonatomic) NSString* userName;
@property (strong, nonatomic) NSString* roles;
@end
