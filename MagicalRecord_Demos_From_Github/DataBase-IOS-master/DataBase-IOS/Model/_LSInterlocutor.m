// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSInterlocutor.m instead.

#import "_LSInterlocutor.h"

const struct LSInterlocutorAttributes LSInterlocutorAttributes = {
	.created_at = @"created_at",
	.current_id = @"current_id",
	.deleted_at = @"deleted_at",
	.name = @"name",
	.updated_at = @"updated_at",
};

@implementation LSInterlocutorID
@end

@implementation _LSInterlocutor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LSInterlocutor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LSInterlocutor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LSInterlocutor" inManagedObjectContext:moc_];
}

- (LSInterlocutorID*)objectID {
	return (LSInterlocutorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"current_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"current_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic created_at;

@dynamic current_id;

- (int64_t)current_idValue {
	NSNumber *result = [self current_id];
	return [result longLongValue];
}

- (void)setCurrent_idValue:(int64_t)value_ {
	[self setCurrent_id:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveCurrent_idValue {
	NSNumber *result = [self primitiveCurrent_id];
	return [result longLongValue];
}

- (void)setPrimitiveCurrent_idValue:(int64_t)value_ {
	[self setPrimitiveCurrent_id:[NSNumber numberWithLongLong:value_]];
}

@dynamic deleted_at;

@dynamic name;

@dynamic updated_at;

@end

