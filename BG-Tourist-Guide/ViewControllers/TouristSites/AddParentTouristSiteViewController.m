//
//  AddParentTouristSiteViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "AddParentTouristSiteViewController.h"
#import "ParentDetailsViewController.h"
#import "TMAlertControllerFactory.h"
#import "TMTouristSitesServices.h"
#import "TMParentTouristSiteRequestModel.h"
#import "TMSimpleParentTouristSiteResponseModel.h"

@interface AddParentTouristSiteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tvName;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
- (IBAction)btnSaveTap:(id)sender;

@end

@implementation AddParentTouristSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnSaveTap:(id)sender {
    if (self.tvName.text.length == 0 || self.tvDescription.text.length == 0) {
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"The name and description fields are required." uiViewController:self andHandler:nil];
        return;
    }
    
    TMTouristSitesServices *touristSites = [[TMTouristSitesServices alloc] init];
    
    TMParentTouristSiteRequestModel *model = [[TMParentTouristSiteRequestModel alloc] init];
    model.Name = self.tvName.text;
    model.Description = self.tvDescription.text;
    model.Type = 1;
    
    [touristSites addParentTouristSite: model andBlock:^(NSError *err, TMSimpleParentTouristSiteResponseModel *result) {
        if (err != nil || result == nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Parent tourist site cannot be save at the moment. Please try again later." uiViewController:self andHandler:nil];
            return;
        }
        
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"Parent tourist site added successfully." uiViewController:self andHandler:^(UIAlertAction * _Nonnull action) {
            
            ParentDetailsViewController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"ParentDetailsController"];
            
            destination.parentTouristSite = result;
                        
            [self.navigationController pushViewController:destination animated:YES];
        }];
    }];
}
@end
