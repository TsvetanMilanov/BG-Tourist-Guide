//
//  LoginViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "TMUserLoginRequestModel.h"
#import "TMRequester.h"
#import "TMAlertControllerFactory.h"
#import "TMActivityIndicatorFactory.h"
#import "TMUserLoginResponseModel.h"
#import "TMConstants.h"
#import "TMProgressAlertDialog.h"

@interface LoginViewController ()
- (IBAction)btnLoginTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnLoginTap:(id)sender {
    TMProgressAlertDialog *progress = [TMAlertControllerFactory progressAlertDialogWithTitle:@"Please wait..."];
    [progress showInViewController:self];
    
    NSString *name = self.tfUsername.text;
    NSString *password = self.tfPassword.text;
    
    TMUserLoginRequestModel *user = [TMUserLoginRequestModel userLoginRequestModelWithUsername:name andPassword:password];
    TMRequester *requester = [[TMRequester alloc] init];
    
    __weak UIViewController *weakSelf = self;
    
    [requester postFormUrlEncodedWithUrl:@"/Token" data:[user toDictionary] andBlock:^(NSError *err, id result) {
        [progress hideWithCompletion:^{
            if (err) {
                [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Unsuccessfull login." uiViewController: weakSelf andHandler:nil];
                return;
            }
            
            TMUserLoginResponseModel *responseUser = [[TMUserLoginResponseModel alloc] initWithDictionary:result error:nil];
            
            NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
            
            [settings setObject:responseUser.access_token forKey: CURRENT_USER_TOKEN_KEY];
            [settings setObject:responseUser.roles forKey: CURRENT_USER_ROLES_KEY];
            
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"Login successfull!" uiViewController:weakSelf andHandler:^(UIAlertAction * _Nonnull action) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }];
            
        }];
    }];
}
@end
