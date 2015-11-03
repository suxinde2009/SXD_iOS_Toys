//
//  Location.h
//  MagicalImportExample
//
//  Created by Denis Lebedev on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Venue;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSNumber * distance;
@property (nonatomic, retain) Venue *venue;

@end
