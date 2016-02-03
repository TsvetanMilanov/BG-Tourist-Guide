//
//  TMProgressAlertDialog.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMProgressAlertDialog.h"

@implementation TMProgressAlertDialog
{
    UIAlertController *_controller;
    UIActivityIndicatorView *_indicator;
}

-(instancetype)initWithAlertController: (UIAlertController*) controller
                  andActivityIndicator: (UIActivityIndicatorView*) indicator{
    if (self = [super init]) {
        _controller = controller;
        _indicator = indicator;
        
        _indicator.center = CGPointMake(135, 60);
        [_controller.view addSubview:_indicator];
    }
    
    return self;
}

-(void) showInViewController: (UIViewController*) parentController{
    [_indicator startAnimating];
    [parentController presentViewController: _controller animated:YES completion:nil];
}

-(void)hideWithCompletion: (void (^ __nullable)(void))completion{
    [_controller removeFromParentViewController];
    [_indicator stopAnimating];
    [_controller dismissViewControllerAnimated:NO completion:completion];
}

@end
