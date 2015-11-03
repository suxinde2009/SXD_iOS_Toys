//
//  AppDelegate.m
//  WeatherWorld
//
//  Created by Pol Quintana on 4/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "CountryViewController.h"
#import "PQCoreDataStack.h"
#import <CoreLocation/CoreLocation.h>
#import "City.h"


@interface AppDelegate ()

@property (nonatomic, strong) NSManagedObjectContext *moc;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    PQCoreDataStack *coreDataStack = [[PQCoreDataStack alloc] initWithPersistentStoreFileName:@"counters.sqlite" andStoreType:NSSQLiteStoreType];
    self.moc = [coreDataStack managedObjectContext];
    
    CLLocationManager *manager = [[CLLocationManager alloc] init];
    [manager requestWhenInUseAuthorization];
    
    UITabBarController *tabBar = (UITabBarController *)self.window.rootViewController;
    
    UINavigationController *navigationController = (UINavigationController *)[tabBar viewControllers][0];
    
    MasterViewController *controller = (MasterViewController *)navigationController.topViewController;
    

    controller.managedObjectContext = self.moc;

    UINavigationController *navigationController2 = (UINavigationController *)[tabBar viewControllers][1];
    
    CountryViewController *controller2 = (CountryViewController *)navigationController2.topViewController;

    controller2.managedObjectContext = self.moc;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSManagedObjectContext *threadCtx = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];

        [threadCtx setParentContext:self.moc];
        City *city = [City insertInManagedObjectContext:threadCtx];
        
        city.longitude = @10.0;
        city.latitude = @10.10;
        
        NSError *error;
        [threadCtx save:&error];
        NSLog(@"%@", error);
    });
    
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
