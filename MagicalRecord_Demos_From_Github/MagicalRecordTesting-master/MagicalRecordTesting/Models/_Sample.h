// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sample.h instead.

#import <CoreData/CoreData.h>


extern const struct SampleAttributes {
	__unsafe_unretained NSString *name;
} SampleAttributes;

extern const struct SampleRelationships {
} SampleRelationships;

extern const struct SampleFetchedProperties {
} SampleFetchedProperties;




@interface SampleID : NSManagedObjectID {}
@end

@interface _Sample : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SampleID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _Sample (CoreDataGeneratedAccessors)

@end

@interface _Sample (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
