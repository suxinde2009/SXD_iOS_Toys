//
//  LDAppDelegate.m
//  MagicalImportExample
//
//  Created by Denis Lebedev on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LDAppDelegate.h"

#import "LDMasterViewController.h"

@implementation LDAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStack];
    return YES;
}
							

@end
