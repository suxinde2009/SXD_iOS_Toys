// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSEvent.m instead.

#import "_LSEvent.h"

const struct LSEventAttributes LSEventAttributes = {
	.access_count = @"access_count",
	.created_at = @"created_at",
	.current_id = @"current_id",
	.deleted_at = @"deleted_at",
	.event_kind_id = @"event_kind_id",
	.event_type_id = @"event_type_id",
	.formulation = @"formulation",
	.frequency = @"frequency",
	.interlocutor_id = @"interlocutor_id",
	.update_at = @"update_at",
};

const struct LSEventRelationships LSEventRelationships = {
	.answer = @"answer",
	.event_tags = @"event_tags",
	.related_events = @"related_events",
};

@implementation LSEventID
@end

@implementation _LSEvent

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LSEvent" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LSEvent";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LSEvent" inManagedObjectContext:moc_];
}

- (LSEventID*)objectID {
	return (LSEventID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"access_countValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"access_count"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"current_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"current_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"event_kind_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"event_kind_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"event_type_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"event_type_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"frequencyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"frequency"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"interlocutor_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"interlocutor_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic access_count;

- (int64_t)access_countValue {
	NSNumber *result = [self access_count];
	return [result longLongValue];
}

- (void)setAccess_countValue:(int64_t)value_ {
	[self setAccess_count:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveAccess_countValue {
	NSNumber *result = [self primitiveAccess_count];
	return [result longLongValue];
}

- (void)setPrimitiveAccess_countValue:(int64_t)value_ {
	[self setPrimitiveAccess_count:[NSNumber numberWithLongLong:value_]];
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

@dynamic event_kind_id;

- (int16_t)event_kind_idValue {
	NSNumber *result = [self event_kind_id];
	return [result shortValue];
}

- (void)setEvent_kind_idValue:(int16_t)value_ {
	[self setEvent_kind_id:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEvent_kind_idValue {
	NSNumber *result = [self primitiveEvent_kind_id];
	return [result shortValue];
}

- (void)setPrimitiveEvent_kind_idValue:(int16_t)value_ {
	[self setPrimitiveEvent_kind_id:[NSNumber numberWithShort:value_]];
}

@dynamic event_type_id;

- (int16_t)event_type_idValue {
	NSNumber *result = [self event_type_id];
	return [result shortValue];
}

- (void)setEvent_type_idValue:(int16_t)value_ {
	[self setEvent_type_id:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEvent_type_idValue {
	NSNumber *result = [self primitiveEvent_type_id];
	return [result shortValue];
}

- (void)setPrimitiveEvent_type_idValue:(int16_t)value_ {
	[self setPrimitiveEvent_type_id:[NSNumber numberWithShort:value_]];
}

@dynamic formulation;

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

@dynamic interlocutor_id;

- (int16_t)interlocutor_idValue {
	NSNumber *result = [self interlocutor_id];
	return [result shortValue];
}

- (void)setInterlocutor_idValue:(int16_t)value_ {
	[self setInterlocutor_id:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveInterlocutor_idValue {
	NSNumber *result = [self primitiveInterlocutor_id];
	return [result shortValue];
}

- (void)setPrimitiveInterlocutor_idValue:(int16_t)value_ {
	[self setPrimitiveInterlocutor_id:[NSNumber numberWithShort:value_]];
}

@dynamic update_at;

@dynamic answer;

@dynamic event_tags;

- (NSMutableSet*)event_tagsSet {
	[self willAccessValueForKey:@"event_tags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"event_tags"];

	[self didAccessValueForKey:@"event_tags"];
	return result;
}

@dynamic related_events;

- (NSMutableSet*)related_eventsSet {
	[self willAccessValueForKey:@"related_events"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"related_events"];

	[self didAccessValueForKey:@"related_events"];
	return result;
}

@end

