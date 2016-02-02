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
    self.layer.borderWidth = 0.1;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.clipsToBounds = YES;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.layer.bounds;
    
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor colorWithWhite:0.7f alpha:0.1f].CGColor,
                            (id)[UIColor colorWithWhite:0.6f alpha:0.2f].CGColor,
                            (id)[UIColor colorWithWhite:0.7f alpha:0.1f].CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:0.5f],
                               [NSNumber numberWithFloat:1.0f],
                               nil];
    
    gradientLayer.cornerRadius = self.layer.cornerRadius;
    [self.layer addSublayer:gradientLayer];
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
