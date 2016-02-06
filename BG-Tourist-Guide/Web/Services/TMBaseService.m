//
//  TMBaseService.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMBaseService.h"

@implementation TMBaseService

-(instancetype)init{
    if (self = [super init]) {
        self.requester = [[TMRequester alloc] init];
    }
    
    return self;
}

@end
