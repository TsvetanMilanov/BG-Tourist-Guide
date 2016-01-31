//
//  LoginViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "LoginViewController.h"
#import "UserLoginRequestModel.h"
#import "Requester.h"
#import "AlertControllerFactory.h"
#import "ActivityIndicatorFactory.h"
#import "UserLoginResponseModel.h"
#import "Constants.h"

@interface LoginViewController ()
- (IBAction)btnLoginTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnLoginTap:(id)sender {
    UIActivityIndicatorView *progressIndicator = [ActivityIndicatorFactory activityIndicatorWithParentView:self.view];
    [progressIndicator startAnimating];
    
    NSString *name = self.tfUsername.text;
    NSString *password = self.tfPassword.text;
    
    UserLoginRequestModel *user = [UserLoginRequestModel userLoginRequestModelWithUsername:name andPassword:password];
    Requester *requester = [[Requester alloc] init];
    
    __weak UIViewController *weakSelf = self;
    
    [requester postFormUrlEncodedWithUrl:@"/Token" data:[user toDictionary] andBlock:^(NSError *err, id result) {
        [progressIndicator stopAnimating];
        
        if (err) {
            [AlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Unsuccessfull login." andUIViewController: weakSelf];
            return;
        }
        
        UserLoginResponseModel *responseUser = [[UserLoginResponseModel alloc] initWithDictionary:result error:nil];
        
        NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
        
        [settings setObject:responseUser.access_token forKey: CURRENT_USER_TOKEN_KEY];
        
        [AlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"Login successfull!" andUIViewController:weakSelf];
    }];
}
@end
