//
//  AlertControllerFactory.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMAlertControllerFactory.h"

@implementation TMAlertControllerFactory
+(UIAlertController *)alertControllerWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: title message: message preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:action];
    
    return alertController;
}

+(void)showAlertDialogWithTitle:(NSString *)title message:(NSString *)message andUIViewController:(UIViewController *)controller{
    UIAlertController *alertController = [TMAlertControllerFactory alertControllerWithTitle:title andMessage:message];
    
    [controller presentViewController:alertController animated:YES completion:nil];
}
@end
