//
//  AlertControllerFactory.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertControllerFactory : NSObject
+(UIAlertController*) alertControllerWithTitle: (NSString*) title
                                    andMessage: (NSString*) message;

+(void) showAlertDialogWithTitle: (NSString*) title
                         message: (NSString*) message
             andUIViewController: (UIViewController*) controller;
@end
