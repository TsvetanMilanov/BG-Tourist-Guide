//
//  TMProgressAlertDialog.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/3/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMProgressAlertDialog : NSObject

-(instancetype _Nullable)initWithAlertController: (UIAlertController* _Nonnull) controller
                  andActivityIndicator: (UIActivityIndicatorView* _Nonnull) indicator;

-(void) showInViewController: (UIViewController* _Nonnull) parentController;

-(void)hideWithCompletion: (void (^ __nullable)(void))completion;
@end
