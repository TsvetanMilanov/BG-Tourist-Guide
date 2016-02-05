//
//  TouristSiteDetailsViewController.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/5/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "TouristSiteDetailsViewController.h"

@interface TouristSiteDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UILabel *lbLatitude;
@property (weak, nonatomic) IBOutlet UILabel *lbLongitude;
@property (weak, nonatomic) IBOutlet UILabel *lbAddress;
@property (weak, nonatomic) IBOutlet UILabel *lbRating;

@end

@implementation TouristSiteDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.touristSite.name;
    
    self.tvDescription.text = self.touristSite.modelDescription;
    self.lbLatitude.text = [NSString stringWithFormat:@"Latitude: %@", self.touristSite.latitude];
    self.lbLongitude.text = [NSString stringWithFormat:@"Longitude: %@", self.touristSite.longitude];
    self.lbAddress.text = [NSString stringWithFormat:@"Address: %@", self.touristSite.address];
    self.lbRating.text = [NSString stringWithFormat:@"Rating: %@ / 10", self.touristSite.rating];
    
    [self.tvDescription beginFloatingCursorAtPoint:CGPointZero];
}

@end
