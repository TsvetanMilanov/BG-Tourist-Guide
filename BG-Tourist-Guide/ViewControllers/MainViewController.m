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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnSyncTopConstraint;

- (IBAction)btnLogoutTap:(id)sender;

@property BOOL isFirstControllerLoad;
@property CGFloat originalbtnSyncTopConstraint;
@property CGFloat originalbtnLogoutTopConstraint;

@end

@implementation MainViewController

-(instancetype)init{
    if (self = [super init]) {
        self.isFirstControllerLoad = YES;
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.isFirstControllerLoad = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    if (self.isFirstControllerLoad == YES) {
        self.originalbtnSyncTopConstraint = self.btnSyncTopConstraint.constant;
        self.originalbtnLogoutTopConstraint = self.btnLogoutTopConstraint.constant;
        self.isFirstControllerLoad = NO;
    }
    
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
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"Logout successfull!" andUIViewController:weakSelf];
        hideProfileControls(self);
    }];
}

void hideProfileControls(MainViewController *controller){
    controller.btnLogin.hidden = NO;
    controller.btnRegister.hidden = NO;
    controller.btnLogout.hidden = YES;
    controller.btnProfile.hidden = YES;
    controller.btnAdministration.hidden = YES;
    if (controller.isFirstControllerLoad == YES) {
        controller.btnLogoutTopConstraint.constant = controller.originalbtnLogoutTopConstraint;
    } else {
        controller.btnSyncTopConstraint.constant = controller.originalbtnSyncTopConstraint - 2 * (controller.btnSyncTopConstraint.constant + controller.btnLogin.frame.size.height);
        controller.btnLogoutTopConstraint.constant = controller.originalbtnLogoutTopConstraint;
    }
    
    
    [controller.view setNeedsUpdateConstraints];
}

void hideAuthenticationControls(MainViewController *controller){
    controller.btnLogin.hidden = YES;
    controller.btnRegister.hidden = YES;
    controller.btnLogout.hidden = NO;
    controller.btnProfile.hidden = NO;
    controller.btnAdministration.hidden = YES;
    if (controller.isFirstControllerLoad == YES) {
        controller.btnLogoutTopConstraint.constant = -2 * (controller.btnLogoutTopConstraint.constant + controller.btnTouristSites.frame.size.height);
        controller.btnSyncTopConstraint.constant = controller.originalbtnSyncTopConstraint;
    } else {
        controller.btnLogoutTopConstraint.constant = controller.originalbtnLogoutTopConstraint -2 * (controller.btnLogoutTopConstraint.constant + controller.btnTouristSites.frame.size.height);
        controller.btnSyncTopConstraint.constant = controller.originalbtnSyncTopConstraint;
    }
    
    [controller.view setNeedsUpdateConstraints];
}

@end
