//
//  TMBaseService.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMRequester.h"

@interface TMBaseService : NSObject

@property (strong, nonatomic) TMRequester *requester;

@end
