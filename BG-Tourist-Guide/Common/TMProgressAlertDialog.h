//
//  TMProgressAlertDialog.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMProgressAlertDialog : NSObject

-(instancetype)initWithAlertController: (UIAlertController*) controller
                  andActivityIndicator: (UIActivityIndicatorView*) indicator;

-(void) showInViewController: (UIViewController*) parentController;

-(void)hideWithCompletion: (void (^ __nullable)(void))completion;
@end
