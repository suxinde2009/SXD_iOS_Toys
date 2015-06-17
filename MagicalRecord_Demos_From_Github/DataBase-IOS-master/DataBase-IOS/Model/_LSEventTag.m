// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSEventTag.m instead.

#import "_LSEventTag.h"

const struct LSEventTagAttributes LSEventTagAttributes = {
	.created_at = @"created_at",
	.current_id = @"current_id",
	.deleted_at = @"deleted_at",
	.event_id = @"event_id",
	.tag_id = @"tag_id",
	.updated_at = @"updated_at",
};

const struct LSEventTagRelationships LSEventTagRelationships = {
	.event = @"event",
	.tag = @"tag",
};

@implementation LSEventTagID
@end

@implementation _LSEventTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LSEventTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LSEventTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LSEventTag" inManagedObjectContext:moc_];
}

- (LSEventTagID*)objectID {
	return (LSEventTagID*)[super objectID];
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
	if ([key isEqualToString:@"tag_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"tag_id"];
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

@dynamic tag_id;

- (int64_t)tag_idValue {
	NSNumber *result = [self tag_id];
	return [result longLongValue];
}

- (void)setTag_idValue:(int64_t)value_ {
	[self setTag_id:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveTag_idValue {
	NSNumber *result = [self primitiveTag_id];
	return [result longLongValue];
}

- (void)setPrimitiveTag_idValue:(int64_t)value_ {
	[self setPrimitiveTag_id:[NSNumber numberWithLongLong:value_]];
}

@dynamic updated_at;

@dynamic event;

@dynamic tag;

@end

