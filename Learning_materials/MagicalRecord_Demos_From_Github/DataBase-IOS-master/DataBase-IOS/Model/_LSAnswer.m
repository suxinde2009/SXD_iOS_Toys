// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSAnswer.m instead.

#import "_LSAnswer.h"

const struct LSAnswerAttributes LSAnswerAttributes = {
	.created_at = @"created_at",
	.current_id = @"current_id",
	.deleted_at = @"deleted_at",
	.event_id = @"event_id",
	.text = @"text",
	.updated_at = @"updated_at",
};

const struct LSAnswerRelationships LSAnswerRelationships = {
	.documents = @"documents",
	.event = @"event",
};

@implementation LSAnswerID
@end

@implementation _LSAnswer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LSAnswer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LSAnswer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LSAnswer" inManagedObjectContext:moc_];
}

- (LSAnswerID*)objectID {
	return (LSAnswerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"current_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"current_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"event_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"event_id"];
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

@dynamic event_id;

- (int64_t)event_idValue {
	NSNumber *result = [self event_id];
	return [result longLongValue];
}

- (void)setEvent_idValue:(int64_t)value_ {
	[self setEvent_id:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveEvent_idValue {
	NSNumber *result = [self primitiveEvent_id];
	return [result longLongValue];
}

- (void)setPrimitiveEvent_idValue:(int64_t)value_ {
	[self setPrimitiveEvent_id:[NSNumber numberWithLongLong:value_]];
}

@dynamic text;

@dynamic updated_at;

@dynamic documents;

- (NSMutableSet*)documentsSet {
	[self willAccessValueForKey:@"documents"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"documents"];

	[self didAccessValueForKey:@"documents"];
	return result;
}

@dynamic event;

@end

