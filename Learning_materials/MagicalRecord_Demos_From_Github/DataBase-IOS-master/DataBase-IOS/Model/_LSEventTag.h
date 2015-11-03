// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSEventTag.h instead.

#import <CoreData/CoreData.h>

extern const struct LSEventTagAttributes {
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *current_id;
	__unsafe_unretained NSString *deleted_at;
	__unsafe_unretained NSString *event_id;
	__unsafe_unretained NSString *tag_id;
	__unsafe_unretained NSString *updated_at;
} LSEventTagAttributes;

extern const struct LSEventTagRelationships {
	__unsafe_unretained NSString *event;
	__unsafe_unretained NSString *tag;
} LSEventTagRelationships;

@class LSEvent;
@class LSTag;

@interface LSEventTagID : NSManagedObjectID {}
@end

@interface _LSEventTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LSEventTagID* objectID;

@property (nonatomic, strong) NSDate* created_at;

//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* current_id;

@property (atomic) int64_t current_idValue;
- (int64_t)current_idValue;
- (void)setCurrent_idValue:(int64_t)value_;

//- (BOOL)validateCurrent_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* deleted_at;

//- (BOOL)validateDeleted_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* event_id;

@property (atomic) int64_t event_idValue;
- (int64_t)event_idValue;
- (void)setEvent_idValue:(int64_t)value_;

//- (BOOL)validateEvent_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* tag_id;

@property (atomic) int64_t tag_idValue;
- (int64_t)tag_idValue;
- (void)setTag_idValue:(int64_t)value_;

//- (BOOL)validateTag_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updated_at;

//- (BOOL)validateUpdated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LSEvent *event;

//- (BOOL)validateEvent:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LSTag *tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;

@end

@interface _LSEventTag (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;

- (NSNumber*)primitiveCurrent_id;
- (void)setPrimitiveCurrent_id:(NSNumber*)value;

- (int64_t)primitiveCurrent_idValue;
- (void)setPrimitiveCurrent_idValue:(int64_t)value_;

- (NSDate*)primitiveDeleted_at;
- (void)setPrimitiveDeleted_at:(NSDate*)value;

- (NSNumber*)primitiveEvent_id;
- (void)setPrimitiveEvent_id:(NSNumber*)value;

- (int64_t)primitiveEvent_idValue;
- (void)setPrimitiveEvent_idValue:(int64_t)value_;

- (NSNumber*)primitiveTag_id;
- (void)setPrimitiveTag_id:(NSNumber*)value;

- (int64_t)primitiveTag_idValue;
- (void)setPrimitiveTag_idValue:(int64_t)value_;

- (NSDate*)primitiveUpdated_at;
- (void)setPrimitiveUpdated_at:(NSDate*)value;

- (LSEvent*)primitiveEvent;
- (void)setPrimitiveEvent:(LSEvent*)value;

- (LSTag*)primitiveTag;
- (void)setPrimitiveTag:(LSTag*)value;

@end
