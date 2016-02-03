//
//  AlertControllerFactory.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TMAlertControllerFactory.h"

@implementation TMAlertControllerFactory
+(UIAlertController *)alertControllerWithTitle:(NSString *)title
                                       message:(NSString *)message
                                    andHandler: (void (^ __nullable)(UIAlertAction *action))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: title message: message preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:handler];
    
    [alertController addAction:action];
    
    return alertController;
}

+(void)showAlertDialogWithTitle:(NSString *)title
                        message:(NSString *)message
               uiViewController:(UIViewController *)controller
                andHandler:(void (^ __nullable)(UIAlertAction *action)) handler{
    UIAlertController *alertController = [TMAlertControllerFactory alertControllerWithTitle:title message:message andHandler: handler];
    
    [controller presentViewController:alertController animated:YES completion: nil];
}

+(TMProgressAlertDialog *)progressAlertDialogWithTitle:(NSString *)title{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: title message: @"\n" preferredStyle: UIAlertControllerStyleAlert];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    TMProgressAlertDialog *customProgressDialog = [[TMProgressAlertDialog alloc] initWithAlertController:alertController andActivityIndicator:indicator];
    
    return customProgressDialog;
}
@end
