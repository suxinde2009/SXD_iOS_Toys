//
//  AppDelegate.h
//  MagicalRecordSample
//
//  Created by  on 12/01/10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
