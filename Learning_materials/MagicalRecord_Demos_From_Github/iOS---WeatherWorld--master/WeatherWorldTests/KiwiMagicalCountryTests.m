#import <Kiwi.h>
#import <ObjectiveSugar.h>
#import <CoreData+MagicalRecord.h>

#import "City.h"
#import "Country.h"

// R-Spec

SPEC_BEGIN(CountryTests)

describe(@"When working with Countries", ^{
    __block City *city;
    
    beforeAll(^{
    });
    
    afterAll(^{
    });
    
    beforeEach(^{
        [MagicalRecord setupCoreDataStackWithInMemoryStore];
        city = [City MR_createEntity];
    });
    
    afterEach(^{
        [MagicalRecord cleanUp];
    });
    
    context(@"When creating a new City", ^{
        it(@"Should contain abc in the name", ^{
            [[city.name should] equal:@"abc"];
        });

        it(@"if you change the name into 'Seville', it's going to be 'Seville'", ^{
            city.name = @"Seville";
            
            [[city.name should] equal:@"Seville"];
        });
        
    });
    
    context(@"When creating a new Country", ^{
        context(@"if you add one hundred cities", ^{
            it(@"should contain 100 cities", ^{
                Country *theCountry = [Country MR_createEntity];
            
                [@100 timesWithIndex:^(NSUInteger index) {
                    City *city = [City MR_createEntity];
                    city.name = [NSString stringWithFormat:@"City %lu", (unsigned long)index];
                    city.country = theCountry;
                }];
                
                [[theCountry.cities shouldNot] beNil];
                [[@(theCountry.cities.count) should] equal:@100];
            });
        });
    });
    
    
    
});



SPEC_END



