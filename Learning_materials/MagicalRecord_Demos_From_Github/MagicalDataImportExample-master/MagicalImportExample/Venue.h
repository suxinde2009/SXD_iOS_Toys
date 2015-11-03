//
//  Venue.h
//  MagicalImportExample
//
//  Created by Denis Lebedev on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Venue : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) NSString *venueID;
@property (nonatomic, retain) NSNumber * checkins;

@end
