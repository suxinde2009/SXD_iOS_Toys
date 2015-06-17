//
//  WeatherWorldTests.m
//  WeatherWorldTests
//
//  Created by Pol Quintana on 4/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "OpenWeatherMap.h"
#import "PQCoreDataStack.h"
#import "City.h"

@interface WeatherWorldTests : XCTestCase

@end

@implementation WeatherWorldTests



- (void)testWeatherJSONInfoForBarcelona {
    OpenWeatherMap *map = [[OpenWeatherMap alloc] init];
    
    NSDictionary *d = [map weatherInfoForCity:@"Barcelona"];
    
    XCTAssertNotNil(d);
    XCTAssertNotNil([d objectForKey:@"weather"]);
}

- (void)testUpdateWeatherCoreDataObject {
    /*
    PQCoreDataStack *cds = [[PQCoreDataStack alloc] init];
    
    NSManagedObjectContext *ctx = [cds managedObjectContext];
    City *barcelona = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:ctx];
    barcelona.name = @"Barcelona,es";
    [ctx save:nil];
    
    OpenWeatherMap *map = [[OpenWeatherMap alloc] init];
    
    NSDictionary *d = [map weatherInfoForCity:barcelona.name];

    [barcelona updateCityDataUsingWeatherData:d];
    
    XCTAssertEqualWithAccuracy([barcelona.latitude floatValue], (float)41.39, 0.001);
    XCTAssertEqualWithAccuracy([barcelona.longitude floatValue], (float)2.16, 0.001);
     */
}


@end
