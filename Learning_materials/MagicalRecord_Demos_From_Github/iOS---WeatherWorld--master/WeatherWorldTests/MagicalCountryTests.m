#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import <CoreData+MagicalRecord.h>

#import "Country.h"
#import "City.h"

#import "OpenWeatherMap.h"

@interface MagicalCountryTests : XCTestCase

@end

@implementation MagicalCountryTests

- (void)setUp {
    [super setUp];
    
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown {
    [MagicalRecord cleanUp];
    
    [super tearDown];
}

- (void)testInsertOneCountry {
    Country *spain = [Country MR_createEntity];
    spain.name = @"Spain";
    spain.flag = @"http://spain";
    
    // IF SPAIN WAS SUCCESSFULLY CREATED THEN
    // SPAIN'S NAME IS "Spain"
    
    XCTAssertNotNil(spain);
    XCTAssertEqualObjects(@"Spain", spain.name);
}

- (void)testInsertOneCityInOneCountry {
    Country *spain = [Country MR_createEntity];
    spain.name = @"Spain";
    spain.flag = @"http://spain";

    City *seville = [City MR_createEntity];
    seville.name = @"Seville";
    seville.country = spain;
    
    XCTAssertNotNil(spain);
    XCTAssertNotNil(seville);

    NSError *error;
    [[NSManagedObjectContext MR_defaultContext] save:&error];
    XCTAssertNil(error);
    
    NSSet *cities = [spain cities];
    XCTAssertTrue(cities.count == 1);
}


- (void)testInsertOneHundredCitiesInOneCountry {
    Country *oneHundredCities = [self theCountryWithOneHundredCities];
    
    XCTAssertNotNil(oneHundredCities);
    XCTAssertEqual(100, oneHundredCities.cities.count);
}

- (Country *)theCountryWithOneHundredCities {
    Country *theCountry = [Country MR_createEntity];
    
    for (int i=0; i<100; i++) {
        City *city = [City MR_createEntity];
        
        city.name = [NSString stringWithFormat:@"City %d", i];
        city.country = theCountry;
    }
    
    return theCountry;
}

- (void)testFetchingOneHundredCitiesInOrderReallyAreOrdered {
    Country *bigCountry = [self theCountryWithOneHundredCities];

    XCTAssertEqual([City MR_countOfEntities], 100);
    
    Country *secondBigCountry = [self theCountryWithOneHundredCities];
    
    XCTAssertEqual([City MR_countOfEntities], 200);

    NSArray *allCities = [City MR_findAllSortedBy:@"name" ascending:YES];
    
    City *firstCity = [allCities firstObject];
    XCTAssertEqualObjects(firstCity.name, @"City 0");
    City *secondCity = allCities[1];
    XCTAssertEqualObjects(secondCity.name, @"City 0");
}



- (void)testRefresh {
    Country *country = [self theCountryWithOneHundredCities];
    
    for (City *city in country.cities) {
        OpenWeatherMap *map = [[OpenWeatherMap alloc] init];
        city.name = @"Barcelona";
        __block NSDictionary *d;
        __block BOOL finished = NO;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            d = [map weatherInfoForCity:city.name];
            
            finished = YES;
        });
        
        while (!finished) ;
        
        XCTAssertNotNil(d);
    }
}




@end
