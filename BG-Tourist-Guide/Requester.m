//
//  Requester.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "Requester.h"
#import "AFNetworking.h"

@interface Requester()
@property NSString *baseUrl;
@end

@implementation Requester
-(instancetype)init{
    if (self = [super init]) {
        self.baseUrl = @"http://localhost:25906";
    }
    
    return self;
}

-(void)postJSONWithUrl:(NSString *)url data:(NSString *)data andBlock:(void (^)(NSError*, id))block{
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.baseUrl, url]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    
    request.HTTPMethod = @"POST";
    request.HTTPBody = [data dataUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        block(nil, responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        block(error, nil);
    }];
    
    [operation start];
}
@end
