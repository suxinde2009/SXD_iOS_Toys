// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSRelatedEvent.m instead.

#import "_LSRelatedEvent.h"

const struct LSRelatedEventAttributes LSRelatedEventAttributes = {
	.created_at = @"created_at",
	.current_id = @"current_id",
	.deleted_at = @"deleted_at",
	.event_id = @"event_id",
	.frequency = @"frequency",
	.previous = @"previous",
	.related_event_id = @"related_event_id",
	.updated_at = @"updated_at",
};

const struct LSRelatedEventRelationships LSRelatedEventRelationships = {
	.event = @"event",
};

@implementation LSRelatedEventID
@end

@implementation _LSRelatedEvent

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LSRelatedEvent" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LSRelatedEvent";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LSRelatedEvent" inManagedObjectContext:moc_];
}

- (LSRelatedEventID*)objectID {
	return (LSRelatedEventID*)[super objectID];
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
	if ([key isEqualToString:@"frequencyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"frequency"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"previousValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"previous"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"related_event_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"related_event_id"];
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

@dynamic frequency;

- (int64_t)frequencyValue {
	NSNumber *result = [self frequency];
	return [result longLongValue];
}

- (void)setFrequencyValue:(int64_t)value_ {
	[self setFrequency:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveFrequencyValue {
	NSNumber *result = [self primitiveFrequency];
	return [result longLongValue];
}

- (void)setPrimitiveFrequencyValue:(int64_t)value_ {
	[self setPrimitiveFrequency:[NSNumber numberWithLongLong:value_]];
}

@dynamic previous;

- (BOOL)previousValue {
	NSNumber *result = [self previous];
	return [result boolValue];
}

- (void)setPreviousValue:(BOOL)value_ {
	[self setPrevious:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePreviousValue {
	NSNumber *result = [self primitivePrevious];
	return [result boolValue];
}

- (void)setPrimitivePreviousValue:(BOOL)value_ {
	[self setPrimitivePrevious:[NSNumber numberWithBool:value_]];
}

@dynamic related_event_id;

- (int64_t)related_event_idValue {
	NSNumber *result = [self related_event_id];
	return [result longLongValue];
}

- (void)setRelated_event_idValue:(int64_t)value_ {
	[self setRelated_event_id:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveRelated_event_idValue {
	NSNumber *result = [self primitiveRelated_event_id];
	return [result longLongValue];
}

- (void)setPrimitiveRelated_event_idValue:(int64_t)value_ {
	[self setPrimitiveRelated_event_id:[NSNumber numberWithLongLong:value_]];
}

@dynamic updated_at;

@dynamic event;

@end

