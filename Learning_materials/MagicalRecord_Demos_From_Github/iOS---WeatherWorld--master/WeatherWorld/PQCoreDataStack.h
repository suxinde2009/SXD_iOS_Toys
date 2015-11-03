//
//  PQCoreDataStack.h
//  CoreDataHelloWorld
//
//  Created by Pol Quintana on 3/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PQCoreDataStack : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, copy) NSString *persistentStoreFileName;

- (instancetype)initWithPersistentStoreFileName:(NSString *)persistentStoreFileName andStoreType:(NSString *)storeType;

+ (void)saveContext:(NSManagedObjectContext *)managedObjectContext;
+ (instancetype)sharedCoreDataStack;

@end
