//
//  RegisterViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserRegisterRequestModel.h"
#import "AlertControllerFactory.h"

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
        [AlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Email, usernam and password fields are required." andUIViewController:self];
        return;
    }
    
    if (password.length < 6 || confirmPassword.length < 6) {
        [AlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Your password must be atleast 6 symbols." andUIViewController:self];
        return;
    }
    
    if ([password compare: confirmPassword] != NSOrderedSame) {
        [AlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Password and Confirm Password doesn't match!" andUIViewController:self];
        return;
    }
    
    UserRegisterRequestModel *user = [UserRegisterRequestModel userRegisterRequestModelWithEmail:email username:username firstName:firstName lastName:lastName password:password andConfirmPassword:confirmPassword];
}
@end
