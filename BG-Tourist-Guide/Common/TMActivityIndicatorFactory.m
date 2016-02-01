//
//  ActivityIndicatorFactory.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMActivityIndicatorFactory.h"

@implementation TMActivityIndicatorFactory
+(UIActivityIndicatorView *)activityIndicatorWithParentView:(UIView *)parent{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 150, 150);
    
    indicator.center = parent.center;
    [parent addSubview: indicator];
    [indicator bringSubviewToFront:parent];
    
    return indicator;
}
@end
