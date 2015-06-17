#import "City.h"

@interface City ()

// Private interface goes here.

@end

@implementation City


- (BOOL)validateForInsert:(NSError *__autoreleasing *)error {
    return YES;
}

- (BOOL)validateForUpdate:(NSError *__autoreleasing *)error {
    return YES;
    
}

- (BOOL)validateForDelete:(NSError *__autoreleasing *)error {
    [super validateForDelete:error];
    
    if ([[self.name lowercaseString] isEqualToString:@"seville"]) {
        return NO;
    }
    
    return YES;
    
}

- (void)updateCityDataUsingWeatherData:(NSDictionary *)jsonWeatherData {
   
    self.latitude = [[jsonWeatherData objectForKey:@"coord"] objectForKey:@"lat"];
    self.longitude = [[jsonWeatherData objectForKey:@"coord"] objectForKey:@"lon"];
    NSArray *weather = [jsonWeatherData objectForKey:@"weather"];
    self.weatherDesc = [weather[0] objectForKey:@"description"];
    self.icon = [weather[0] objectForKey:@"icon"];
    
}


+ (NSFetchRequest *)allCountersFetchRequestInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[City entityInManagedObjectContext:context]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[sortName];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    return fetchRequest;
}

+ (NSArray *)allCitiesInContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[City entityName]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    if (error) {
        return nil;
    }
    
    return result;
}

+ (void)deleteAllInContext:(NSManagedObjectContext *)context {
    for (City *obj in [self allCitiesInContext:context]) {
        [context deleteObject:obj];
    }
    NSError *error;
    if ([context hasChanges] && ![context save:&error]) {
        abort();
    }
}

@end
