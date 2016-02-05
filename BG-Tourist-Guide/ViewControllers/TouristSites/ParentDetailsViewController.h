//
//  ParentDetailsViewController.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 2/4/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMSimpleParentTouristSiteResponseModel.h"

@interface ParentDetailsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) TMSimpleParentTouristSiteResponseModel* parentTouristSite;
@end
