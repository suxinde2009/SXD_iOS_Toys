//
//  PersistenceSampleAppDelegate.m
//  PersistenceSample
//
//  Created by Ing. Jozef Bozek on 27.12.2010.
//  Copyright 2010 bring-it-together s.r.o. All rights reserved.
//

#import "PersistenceSampleAppDelegate.h"
#import "RootViewController.h"
#import "DAOFactory.h"

@implementation PersistenceSampleAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [DAOFactory setStorePath:@"PersistenceSample.sqlite"];
	DAOFactory *factory = [DAOFactory factory];
	[[factory managedObjectContext] setRetainsRegisteredObjects:YES];
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}

/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
	
    NSError *error = nil;
	DAOFactory *factory = [DAOFactory factory];
	if ([factory.managedObjectContext hasChanges] && ![factory save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		abort();
	}
}




#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	
    [managedObjectContext release];
    [managedObjectModel release];
    [persistentStoreCoordinator release];
    
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

