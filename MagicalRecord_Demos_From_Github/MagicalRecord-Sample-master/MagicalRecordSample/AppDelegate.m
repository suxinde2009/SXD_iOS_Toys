//
//  AppDelegate.m
//  MagicalRecordSample
//
//  Created by  on 12/01/10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"


@implementation AppDelegate

@synthesize window = _window;


- (void)dealloc {
    [_window release];

    [super dealloc];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /* MagicalRecord Sample Code */
    // sqliteファイルの保存名の設定
    [MagicalRecordHelpers setupCoreDataStackWithStoreNamed:@"MagicalRecordSample.sqlite"];

    Person *person = [Person MR_createEntity];// エンティティを作成する
    person.name = @"hito";
    person.age = [NSDecimalNumber decimalNumberWithString:@"18"];
    [[NSManagedObjectContext MR_defaultContext] MR_save];// 保存

    // 保存した結果を表示
    NSLog(@"MagicalRecord FindAll");
    NSArray *result = [Person MR_findAll];
    for (id per in result) {
        NSLog(@"name : %@ | age : %d", [per name], [[per age] integerValue]);
    }

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Saves changes in the application's managed object context before the application terminates.
    [MagicalRecordHelpers cleanUp];
}


#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]
                            lastObject];
}

@end
