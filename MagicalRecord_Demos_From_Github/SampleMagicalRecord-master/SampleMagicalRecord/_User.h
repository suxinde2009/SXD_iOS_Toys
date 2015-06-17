// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to User.h instead.

#import <CoreData/CoreData.h>


extern const struct UserAttributes {
	__unsafe_unretained NSString *age;
	__unsafe_unretained NSString *name;
} UserAttributes;

extern const struct UserRelationships {
} UserRelationships;

extern const struct UserFetchedProperties {
} UserFetchedProperties;





@interface UserID : NSManagedObjectID {}
@end

@interface _User : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (UserID*)objectID;




@property (nonatomic, strong) NSDecimalNumber* age;


//- (BOOL)validateAge:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSString* name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;






@end

@interface _User (CoreDataGeneratedAccessors)

@end

@interface _User (CoreDataGeneratedPrimitiveAccessors)


- (NSDecimalNumber*)primitiveAge;
- (void)setPrimitiveAge:(NSDecimalNumber*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




@end
