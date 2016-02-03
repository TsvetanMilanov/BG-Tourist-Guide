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
    [self sizeThatFits: CGSizeMake(self.bounds.size.width, self.bounds.size.height + 100)];
    self.layer.cornerRadius = 25;
    self.layer.borderWidth = 0.1;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.clipsToBounds = YES;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.layer.bounds;
    
//    gradientLayer.colors = [NSArray arrayWithObjects:
//                            (id)[UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:1].CGColor,
//                            (id)[UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1].CGColor,
//                            (id)[UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:1].CGColor,
//                            nil];
//    
//    gradientLayer.locations = [NSArray arrayWithObjects:
//                               [NSNumber numberWithFloat:0.0f],
//                               [NSNumber numberWithFloat:0.5f],
//                               [NSNumber numberWithFloat:1.0f],
//                               nil];
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1].CGColor,
                            (id)[UIColor colorWithRed:150.0/255 green:150.0/255 blue:150.0/255 alpha:1].CGColor,
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
