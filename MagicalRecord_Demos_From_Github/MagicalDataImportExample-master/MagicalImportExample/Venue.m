//
//  Venue.m
//  MagicalImportExample
//
//  Created by Denis Lebedev on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Venue.h"
#import "Location.h"

@implementation Venue

@dynamic name;
@dynamic location;
@dynamic venueID;
@dynamic checkins;

- (BOOL)shouldImportLocation:(id)location {
    NSString *address = [location objectForKey:@"address"];
    return address ? YES : NO;
}
@end
