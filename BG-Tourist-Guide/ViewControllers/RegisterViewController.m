//
//  RegisterViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "RegisterViewController.h"
#import "MainViewController.h"
#import "TMUserRegisterRequestModel.h"
#import "TMAlertControllerFactory.h"
#import "TMRequester.h"

@interface RegisterViewController ()
- (IBAction)btnRegisterTap:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfFirstName;
@property (weak, nonatomic) IBOutlet UITextField *tfLastName;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfConfirmPassword;

@end

@implementation RegisterViewController

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

- (IBAction)btnRegisterTap:(id)sender {
    NSString *email = self.tfEmail.text;
    NSString *username = self.tfUsername.text;
    NSString *firstName = self.tfFirstName.text;
    NSString *lastName = self.tfLastName.text;
    NSString *password = self.tfPassword.text;
    NSString *confirmPassword = self.tfConfirmPassword.text;
    
    
    if (email.length <= 0 ||
        username.length <= 0 ||
        password.length <= 0 ||
        confirmPassword.length <= 0) {
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Email, usernam and password fields are required." uiViewController:self andHandler:nil];
        return;
    }
    
    if (password.length < 6 || confirmPassword.length < 6) {
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Your password must be atleast 6 symbols." uiViewController:self andHandler:nil];
        return;
    }
    
    if ([password compare: confirmPassword] != NSOrderedSame) {
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Password and Confirm Password doesn't match!" uiViewController:self andHandler:nil];
        return;
    }
    
    TMUserRegisterRequestModel *user = [TMUserRegisterRequestModel userRegisterRequestModelWithEmail:email username:username firstName:firstName lastName:lastName password:password andConfirmPassword:confirmPassword];
    
    TMRequester* requester = [[TMRequester alloc]init];
    
    __weak UIViewController *weakSelf = self;
    
    [requester postJSONWithUrl:@"/api/Account/Register" data:[user toJSONString] andBlock:^(NSError *err, id result) {
        if (err) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot register user." uiViewController:weakSelf andHandler:nil];
            return;
        }
        
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"Registration successfull. Now You can login." uiViewController:weakSelf andHandler:^(UIAlertAction * _Nonnull action) {
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
            [weakSelf.navigationController pushViewController:[[MainViewController alloc] init] animated:YES];
        }];
    }];
}
@end
