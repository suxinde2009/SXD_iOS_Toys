//
//  Student.h
//  CoreDataTestDemo
//
//  Created by suxinde on 15/6/24.
//  Copyright (c) 2015年 com.skypraryer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *card;

@end
