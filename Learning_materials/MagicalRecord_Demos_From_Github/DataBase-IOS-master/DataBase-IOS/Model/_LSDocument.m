// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSDocument.m instead.

#import "_LSDocument.h"

const struct LSDocumentAttributes LSDocumentAttributes = {
	.answer_id = @"answer_id",
	.created_at = @"created_at",
	.current_id = @"current_id",
	.deleted_at = @"deleted_at",
	.justification = @"justification",
	.updated_at = @"updated_at",
	.url = @"url",
};

const struct LSDocumentRelationships LSDocumentRelationships = {
	.answer = @"answer",
};

@implementation LSDocumentID
@end

@implementation _LSDocument

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LSDocument" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LSDocument";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LSDocument" inManagedObjectContext:moc_];
}

- (LSDocumentID*)objectID {
	return (LSDocumentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"answer_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"answer_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"current_idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"current_id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic answer_id;

- (int64_t)answer_idValue {
	NSNumber *result = [self answer_id];
	return [result longLongValue];
}

- (void)setAnswer_idValue:(int64_t)value_ {
	[self setAnswer_id:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveAnswer_idValue {
	NSNumber *result = [self primitiveAnswer_id];
	return [result longLongValue];
}

- (void)setPrimitiveAnswer_idValue:(int64_t)value_ {
	[self setPrimitiveAnswer_id:[NSNumber numberWithLongLong:value_]];
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

@dynamic justification;

@dynamic updated_at;

@dynamic url;

@dynamic answer;

@end

