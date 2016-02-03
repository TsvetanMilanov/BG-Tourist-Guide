//
//  CustomTabBarItem.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "CustomTabBarItem.h"

@implementation CustomTabBarItem

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName:@"Verdana" size:24.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    }
    return self;
}

@end
