// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Country.h instead.

#import <CoreData/CoreData.h>

extern const struct CountryAttributes {
	__unsafe_unretained NSString *flag;
	__unsafe_unretained NSString *name;
} CountryAttributes;

extern const struct CountryRelationships {
	__unsafe_unretained NSString *cities;
} CountryRelationships;

@class City;

@interface CountryID : NSManagedObjectID {}
@end

@interface _Country : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CountryID* objectID;

@property (nonatomic, strong) NSString* flag;

//- (BOOL)validateFlag:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *cities;

- (NSMutableSet*)citiesSet;

@end

@interface _Country (CitiesCoreDataGeneratedAccessors)
- (void)addCities:(NSSet*)value_;
- (void)removeCities:(NSSet*)value_;
- (void)addCitiesObject:(City*)value_;
- (void)removeCitiesObject:(City*)value_;

@end

@interface _Country (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveFlag;
- (void)setPrimitiveFlag:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveCities;
- (void)setPrimitiveCities:(NSMutableSet*)value;

@end
