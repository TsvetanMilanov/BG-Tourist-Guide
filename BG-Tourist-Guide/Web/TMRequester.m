//
//  Requester.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMRequester.h"
#import "AFNetworking.h"

@interface TMRequester()
@property NSString *baseUrl;
@end

@implementation TMRequester
-(instancetype)init{
    if (self = [super init]) {
        self.baseUrl = @"http://bg-tourist-guide-server.apphb.com";
    }
    
    return self;
}

-(void)postJSONWithUrl:(NSString *)url data:(NSString *)data andBlock:(void (^)(NSError*, id))block{
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.baseUrl, url]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    
    [request setTimeoutInterval: 60*3];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSData *requestBody =[data dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBody;
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        block(nil, responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        block(error, nil);
    }];
    
    [operation start];
}

-(void)postFormUrlEncodedWithUrl:(NSString *)url data:(NSDictionary *)data andBlock:(void (^)(NSError*, id))block{
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.baseUrl, url]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    
    [request setTimeoutInterval: 60*3];
    request.HTTPMethod = @"POST";
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableString *dataFormUrlEncoded = [NSMutableString stringWithString:@""];
    
    BOOL isFirstParameter = YES;
    
    for (id key in data) {
        if (isFirstParameter == YES) {
            isFirstParameter = NO;
            
            [dataFormUrlEncoded appendFormat:@"%@=%@",key, data[key]];
            
            continue;
        }
        
        [dataFormUrlEncoded appendFormat:@"&%@=%@",key, data[key]];
    }
    
    
    NSData *requestBody =[dataFormUrlEncoded dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = requestBody;
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        block(nil, responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        block(error, nil);
    }];
    
    [operation start];
}

-(void)getJSONWithUrl:(NSString *)url andBlock:(void (^)(NSError* err, id result))block{
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", self.baseUrl, url]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    
    [request setTimeoutInterval: 60*3];
    request.HTTPMethod = @"GET";
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
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
