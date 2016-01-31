//
//  Requester.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Requester : NSObject

-(instancetype)init;

-(void) postJSONWithUrl: (NSString*) url
                 data: (NSString*) data
              andBlock: (void (^)(NSError *err, id result)) block;
@end
