//
//  Card.h
//  CoreDataTestDemo
//
//  Created by suxinde on 15/6/24.
//  Copyright (c) 2015年 com.skypraryer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface Card : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) Student *student;

@end
