// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSEventKind.h instead.

#import <CoreData/CoreData.h>

extern const struct LSEventKindAttributes {
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *current_id;
	__unsafe_unretained NSString *deleted_at;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *updated_at;
} LSEventKindAttributes;

@interface LSEventKindID : NSManagedObjectID {}
@end

@interface _LSEventKind : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LSEventKindID* objectID;

@property (nonatomic, strong) NSDate* created_at;

//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* current_id;

@property (atomic) int64_t current_idValue;
- (int64_t)current_idValue;
- (void)setCurrent_idValue:(int64_t)value_;

//- (BOOL)validateCurrent_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* deleted_at;

//- (BOOL)validateDeleted_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updated_at;

//- (BOOL)validateUpdated_at:(id*)value_ error:(NSError**)error_;

@end

@interface _LSEventKind (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;

- (NSNumber*)primitiveCurrent_id;
- (void)setPrimitiveCurrent_id:(NSNumber*)value;

- (int64_t)primitiveCurrent_idValue;
- (void)setPrimitiveCurrent_idValue:(int64_t)value_;

- (NSDate*)primitiveDeleted_at;
- (void)setPrimitiveDeleted_at:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSDate*)primitiveUpdated_at;
- (void)setPrimitiveUpdated_at:(NSDate*)value;

@end
