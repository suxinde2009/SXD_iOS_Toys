// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to City.m instead.

#import "_City.h"

const struct CityAttributes CityAttributes = {
	.icon = @"icon",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.name = @"name",
	.temp = @"temp",
	.weatherDesc = @"weatherDesc",
};

const struct CityRelationships CityRelationships = {
	.country = @"country",
};

@implementation CityID
@end

@implementation _City

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"City";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"City" inManagedObjectContext:moc_];
}

- (CityID*)objectID {
	return (CityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"tempValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"temp"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic icon;

@dynamic latitude;

- (float)latitudeValue {
	NSNumber *result = [self latitude];
	return [result floatValue];
}

- (void)setLatitudeValue:(float)value_ {
	[self setLatitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result floatValue];
}

- (void)setPrimitiveLatitudeValue:(float)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithFloat:value_]];
}

@dynamic longitude;

- (float)longitudeValue {
	NSNumber *result = [self longitude];
	return [result floatValue];
}

- (void)setLongitudeValue:(float)value_ {
	[self setLongitude:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result floatValue];
}

- (void)setPrimitiveLongitudeValue:(float)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithFloat:value_]];
}

@dynamic name;

@dynamic temp;

- (float)tempValue {
	NSNumber *result = [self temp];
	return [result floatValue];
}

- (void)setTempValue:(float)value_ {
	[self setTemp:[NSNumber numberWithFloat:value_]];
}

- (float)primitiveTempValue {
	NSNumber *result = [self primitiveTemp];
	return [result floatValue];
}

- (void)setPrimitiveTempValue:(float)value_ {
	[self setPrimitiveTemp:[NSNumber numberWithFloat:value_]];
}

@dynamic weatherDesc;

@dynamic country;

@end

