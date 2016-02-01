//
//  ActivityIndicatorFactory.h
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/31/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TMActivityIndicatorFactory : NSObject
+(UIActivityIndicatorView*) activityIndicatorWithParentView: (UIView *) parent;
@end
