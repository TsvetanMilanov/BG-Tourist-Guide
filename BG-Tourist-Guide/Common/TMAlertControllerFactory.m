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

+(void)showCancelableAlertDialogWithTitle:(NSString *)title
                        message:(NSString *)message
               uiViewController:(UIViewController *)controller
                     andHandler:(void (^ __nullable)(UIAlertAction *action)) handler{
    UIAlertController *alertController = [TMAlertControllerFactory alertControllerWithTitle:title message:message andHandler: handler];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil]];
    
    [controller presentViewController:alertController animated:YES completion: nil];
}

+(TMProgressAlertDialog *)progressAlertDialogWithTitle:(NSString *)title{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: title message: @"\n" preferredStyle: UIAlertControllerStyleAlert];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    TMProgressAlertDialog *customProgressDialog = [[TMProgressAlertDialog alloc] initWithAlertController:alertController andActivityIndicator:indicator];
    
    return customProgressDialog;
}

+(void) showTextInputDialogWithTitle: (NSString* _Nonnull) title
                          controller: (UIViewController* _Nonnull) controller
                          andHandler: (void (^ __nullable)(NSString* _Nonnull textField))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: title message: nil preferredStyle: UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Code...";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *text = alertController.textFields[0].text;
        
        if (text.length == 0) {
            return;
        }
        
        handler(text);
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    
    [controller presentViewController:alertController animated:YES completion: nil];
}

@end
