// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Country.m instead.

#import "_Country.h"

const struct CountryAttributes CountryAttributes = {
	.flag = @"flag",
	.name = @"name",
};

const struct CountryRelationships CountryRelationships = {
	.cities = @"cities",
};

@implementation CountryID
@end

@implementation _Country

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Country" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Country";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Country" inManagedObjectContext:moc_];
}

- (CountryID*)objectID {
	return (CountryID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic flag;

@dynamic name;

@dynamic cities;

- (NSMutableSet*)citiesSet {
	[self willAccessValueForKey:@"cities"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"cities"];

	[self didAccessValueForKey:@"cities"];
	return result;
}

@end

