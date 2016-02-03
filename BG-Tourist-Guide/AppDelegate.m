//
//  AppDelegate.m
//  BG-Tourist-Guide
//
//  Created by Hakintosh on 1/30/16.
//  Copyright © 2016 Hakintosh. All rights reserved.
//

#import "AppDelegate.h"
#import "TMSQLiteDatabaseHandler.h"
#import "TMParentTouristSiteModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    TMSQLiteDatabaseHandler *dbHandler = [TMSQLiteDatabaseHandler new];
//    
//    [dbHandler createDatabase];
//    TMParentTouristSiteModel *site = [TMParentTouristSiteModel new];
//    site.name = @"test";
//    site.modelDescription = @"descr";
//    site.type = 0;
//    
//    BOOL result = [dbHandler addParentTouristSite:site];
//    
//    TMParentTouristSiteModel *site1 = [TMParentTouristSiteModel new];
//    site1.name = @"test1";
//    site1.modelDescription = @"descr1";
//    site1.type = 0;
//    
//    TMParentTouristSiteModel *site2 = [TMParentTouristSiteModel new];
//    site2.name = @"test2";
//    site2.modelDescription = @"descr2";
//    site2.type = 0;
//    
//    TMParentTouristSiteModel *site3 = [TMParentTouristSiteModel new];
//    site3.name = @"test3";
//    site3.modelDescription = @"descr3";
//    site3.type = 0;
//    
//    [dbHandler batchAddParentTouristSites:@[site1, site2, site3]];
//    
//    NSArray *result = [dbHandler getAllParentTouristSitesNames];
//    for (NSString *name in result) {
//        NSLog(@"%@", name);
//    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
