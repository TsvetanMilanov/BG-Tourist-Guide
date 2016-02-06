//
//  AddTouristSiteViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/6/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "AddTouristSiteViewController.h"
#import "TMAlertControllerFactory.h"
#import "TMTouristSiteRequestModel.h"
#import "TMTouristSitesServices.h"

@interface AddTouristSiteViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tvName;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UITextField *tvAddress;
@property (weak, nonatomic) IBOutlet UITextField *tvLatitude;
@property (weak, nonatomic) IBOutlet UITextField *tvLongitude;
- (IBAction)btnSaveTap:(id)sender;

@end

@implementation AddTouristSiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnSaveTap:(id)sender {
    NSString *name = self.tvName.text;
    NSString *description = self.tvDescription.text;
    NSString *address = self.tvAddress.text;
    NSString *latitudeString = self.tvLatitude.text;
    NSString *longitudeString = self.tvLongitude.text;
    
    if (name.length == 0 ||
        description.length == 0 ||
        address.length == 0 ||
        latitudeString.length == 0 ||
        longitudeString.length == 0) {
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Please fill all fields." uiViewController:self andHandler:nil];
        return;
    }
    
    double latitude = [latitudeString doubleValue];
    double longitude = [longitudeString doubleValue];
    
    TMTouristSiteRequestModel *model = [[TMTouristSiteRequestModel alloc] init];
    
    model.Name = name;
    model.Description = description;
    model.Address = address;
    model.Latitude = latitude;
    model.Longitude = longitude;
    model.ParentTouristSiteId = self.parentTouristSiteId;
    
    TMTouristSitesServices *touristSites = [[TMTouristSitesServices alloc]init];
    
    [touristSites addTouristSite:model andBlock:^(NSError *err, TMSimpleTouristSiteResponseModel *result) {
        if (err != nil || result == nil) {
            [TMAlertControllerFactory showAlertDialogWithTitle:@"Error" message:@"Cannot save the tourist site at the moment. Please try again later." uiViewController:self andHandler:nil];
            return;
        }
        
        [TMAlertControllerFactory showAlertDialogWithTitle:@"Success" message:@"The tourist site is saved successfully. It will be added for rating when it is approved by our moderators." uiViewController:self andHandler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popToRootViewControllerAnimated: YES];
        }];
    }];
}
@end
