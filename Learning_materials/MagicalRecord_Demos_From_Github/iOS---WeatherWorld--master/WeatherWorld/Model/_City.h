// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to City.h instead.

#import <CoreData/CoreData.h>

extern const struct CityAttributes {
	__unsafe_unretained NSString *icon;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *temp;
	__unsafe_unretained NSString *weatherDesc;
} CityAttributes;

extern const struct CityRelationships {
	__unsafe_unretained NSString *country;
} CityRelationships;

@class Country;

@interface CityID : NSManagedObjectID {}
@end

@interface _City : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CityID* objectID;

@property (nonatomic, strong) NSString* icon;

//- (BOOL)validateIcon:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* latitude;

@property (atomic) float latitudeValue;
- (float)latitudeValue;
- (void)setLatitudeValue:(float)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* longitude;

@property (atomic) float longitudeValue;
- (float)longitudeValue;
- (void)setLongitudeValue:(float)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* temp;

@property (atomic) float tempValue;
- (float)tempValue;
- (void)setTempValue:(float)value_;

//- (BOOL)validateTemp:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* weatherDesc;

//- (BOOL)validateWeatherDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Country *country;

//- (BOOL)validateCountry:(id*)value_ error:(NSError**)error_;

@end

@interface _City (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveIcon;
- (void)setPrimitiveIcon:(NSString*)value;

- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (float)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(float)value_;

- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (float)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(float)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitiveTemp;
- (void)setPrimitiveTemp:(NSNumber*)value;

- (float)primitiveTempValue;
- (void)setPrimitiveTempValue:(float)value_;

- (NSString*)primitiveWeatherDesc;
- (void)setPrimitiveWeatherDesc:(NSString*)value;

- (Country*)primitiveCountry;
- (void)setPrimitiveCountry:(Country*)value;

@end
