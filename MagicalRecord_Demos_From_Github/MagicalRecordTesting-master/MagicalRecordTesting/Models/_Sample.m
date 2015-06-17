// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sample.m instead.

#import "_Sample.h"

const struct SampleAttributes SampleAttributes = {
	.name = @"name",
};

const struct SampleRelationships SampleRelationships = {
};

const struct SampleFetchedProperties SampleFetchedProperties = {
};

@implementation SampleID
@end

@implementation _Sample

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Sample" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Sample";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Sample" inManagedObjectContext:moc_];
}

- (SampleID*)objectID {
	return (SampleID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;











@end
