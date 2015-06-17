//
//  PersistenceSampleAppDelegate.h
//  PersistenceSample
//
//  Created by Ing. Jozef Bozek on 27.12.2010.
//  Copyright 2010 bring-it-together s.r.o. All rights reserved.
//

@interface PersistenceSampleAppDelegate : NSObject <UIApplicationDelegate> {
    
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;	    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;

    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (NSString *)applicationDocumentsDirectory;

@end

