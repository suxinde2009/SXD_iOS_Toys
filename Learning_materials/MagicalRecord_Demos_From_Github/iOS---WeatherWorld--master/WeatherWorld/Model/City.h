#import "_City.h"

@interface City : _City {}

+ (NSFetchRequest *)allCountersFetchRequestInContext:(NSManagedObjectContext *)context;
+ (void)deleteAllInContext:(NSManagedObjectContext *)context;


- (void)updateCityDataUsingWeatherData:(NSDictionary *)jsonWeatherData;

@end
