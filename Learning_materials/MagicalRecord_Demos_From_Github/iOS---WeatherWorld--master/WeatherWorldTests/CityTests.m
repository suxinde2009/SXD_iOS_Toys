#import <Kiwi.h>
#import "PQCoreDataStack.h"

/*
SPEC_BEGIN(City)

__block NSManagedObjectContext *ctx;

describe(@"The City Entity", ^{
    context(@"When creating a new City", ^{
        beforeEach(^{
            ctx = [[[PQCoreDataStack alloc] init] managedObjectContext];
            
        });
        
        it(@"Has non empty name after insertion", ^{
            City *city = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:ctx];
            
            NSError *error;
            [ctx save:&error];
        
            [[error should] beNil];
            [[city should] haveValue:@"a" forKey:@"name"];
        });
    });
});

SPEC_END
*/

