//
//  RoundedCornersButton.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/2/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "RoundedCornersButton.h"

@implementation RoundedCornersButton

- (void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = 15;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.layer.bounds;
    
//    gradientLayer.colors = [NSArray arrayWithObjects:
//                            (id)[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1].CGColor,
//                            (id)[UIColor colorWithRed:20.0/255 green:240.0/255 blue:0.0 alpha:1].CGColor,
//                            (id)[UIColor colorWithRed:255/255 green:40.0/255 blue:40.0/255 alpha:1].CGColor,
//                            nil];
//    
//    gradientLayer.locations = [NSArray arrayWithObjects:
//                               [NSNumber numberWithFloat:0.2],
//                               [NSNumber numberWithFloat:0.5],
//                               [NSNumber numberWithFloat:1.0],
//                               nil];
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1].CGColor,
                            (id)[UIColor colorWithRed:180.0/255 green:180.0/255 blue:180.0/255 alpha:1].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    
    gradientLayer.cornerRadius = self.layer.cornerRadius;
    [self.layer addSublayer:gradientLayer];
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview: self.titleLabel];
}

@end
