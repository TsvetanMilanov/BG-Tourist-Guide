//
//  TMAccountServices.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMBaseService.h"
#import "TMProfileResponseModel.h"

@interface TMAccountServices : TMBaseService
-(void) getProfileInformationWithBlock: (void(^)(NSError *err, TMProfileResponseModel *result)) block;
@end
