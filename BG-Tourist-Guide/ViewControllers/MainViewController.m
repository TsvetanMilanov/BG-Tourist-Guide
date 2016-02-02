//
//  ViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "MainViewController.h"
#import "TMConstants.h"
#import "TMAlertControllerFactory.h"
#import "TMRequester.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;
@property (weak, nonatomic) IBOutlet UIButton *btnProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnTouristSites;
@property (weak, nonatomic) IBOutlet UIButton *btnAdministration;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnLogoutTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnRegisterTopConstraint;

- (IBAction)btnLogoutTap:(id)sender;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnLogoutTopConstraint.constant = - 2 * (self.btnLogoutTopConstraint.constant + self.btnTouristSites.frame.size.height);
    
    [self.view setNeedsUpdateConstraints];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    if ([[settings objectForKey:CURRENT_USER_TOKEN_KEY] length] > 0) {
        hideAuthenticationControls(self);
    } else{
        hideProfileControls(self);
    }
}

- (IBAction)btnLogoutTap:(id)sender {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    
    [settings setObject:nil forKey:CURRENT_USER_TOKEN_KEY];
    
    TMRequester *requester = [[TMRequester alloc] init];
    
    __weak UIViewController *weakSelf = self;
    
    [requester postJSONWithUrl:@"Account/Logout" data:@"" andBlock:^(NSError *err, id result) {
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"Logout successfull!" uiViewController:weakSelf andHandler:nil];
        hideProfileControls(self);
    }];
}

void hideProfileControls(MainViewController *controller){
    controller.btnLogin.hidden = NO;
    controller.btnRegister.hidden = NO;
    controller.btnLogout.hidden = YES;
    controller.btnProfile.hidden = YES;
    controller.btnAdministration.hidden = YES;
}

void hideAuthenticationControls(MainViewController *controller){
    controller.btnLogin.hidden = YES;
    controller.btnRegister.hidden = YES;
    controller.btnLogout.hidden = NO;
    controller.btnProfile.hidden = NO;
    
    NSString* currenUserRoles = [[NSUserDefaults standardUserDefaults] valueForKey: CURRENT_USER_ROLES_KEY];
    
    if ([currenUserRoles containsString: ADMIN_USER_ROLE]) {
        controller.btnAdministration.hidden = NO;
    }
}

@end
