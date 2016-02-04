//
//  Requester.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMRequester : NSObject

-(instancetype)init;

-(void) postJSONWithUrl: (NSString*) url
                   data: (NSString*) data
               andBlock: (void (^)(NSError *err, id result)) block;

-(void) postFormUrlEncodedWithUrl: (NSString*) url
                             data: (NSDictionary*) data
                         andBlock: (void (^)(NSError *err, id result)) block;

-(void)getJSONWithUrl:(NSString *)url
             andBlock:(void (^)(NSError*, id))block;
@end
