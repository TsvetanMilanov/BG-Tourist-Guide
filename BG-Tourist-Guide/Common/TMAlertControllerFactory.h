//
//  AlertControllerFactory.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TMAlertControllerFactory : NSObject
+(UIAlertController* _Nonnull) alertControllerWithTitle: (NSString* _Nullable) title
                                    message: (NSString* _Nullable) message
                                    andHandler: (void (^ __nullable)(UIAlertAction* _Nonnull action))handler;

+(void) showAlertDialogWithTitle: (NSString* _Nullable) title
                         message: (NSString* _Nullable) message
                uiViewController: (UIViewController* _Nonnull) controller
                      andHandler: (void (^ __nullable)(UIAlertAction* _Nonnull action))handler;
@end
