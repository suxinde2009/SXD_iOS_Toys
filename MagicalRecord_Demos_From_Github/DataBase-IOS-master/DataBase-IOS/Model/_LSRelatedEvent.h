// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSRelatedEvent.h instead.

#import <CoreData/CoreData.h>

extern const struct LSRelatedEventAttributes {
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *current_id;
	__unsafe_unretained NSString *deleted_at;
	__unsafe_unretained NSString *event_id;
	__unsafe_unretained NSString *frequency;
	__unsafe_unretained NSString *previous;
	__unsafe_unretained NSString *related_event_id;
	__unsafe_unretained NSString *updated_at;
} LSRelatedEventAttributes;

extern const struct LSRelatedEventRelationships {
	__unsafe_unretained NSString *event;
} LSRelatedEventRelationships;

@class LSEvent;

@interface LSRelatedEventID : NSManagedObjectID {}
@end

@interface _LSRelatedEvent : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LSRelatedEventID* objectID;

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

@property (nonatomic, strong) NSNumber* frequency;

@property (atomic) int64_t frequencyValue;
- (int64_t)frequencyValue;
- (void)setFrequencyValue:(int64_t)value_;

//- (BOOL)validateFrequency:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* previous;

@property (atomic) BOOL previousValue;
- (BOOL)previousValue;
- (void)setPreviousValue:(BOOL)value_;

//- (BOOL)validatePrevious:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* related_event_id;

@property (atomic) int64_t related_event_idValue;
- (int64_t)related_event_idValue;
- (void)setRelated_event_idValue:(int64_t)value_;

//- (BOOL)validateRelated_event_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updated_at;

//- (BOOL)validateUpdated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LSEvent *event;

//- (BOOL)validateEvent:(id*)value_ error:(NSError**)error_;

@end

@interface _LSRelatedEvent (CoreDataGeneratedPrimitiveAccessors)

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

- (NSNumber*)primitiveFrequency;
- (void)setPrimitiveFrequency:(NSNumber*)value;

- (int64_t)primitiveFrequencyValue;
- (void)setPrimitiveFrequencyValue:(int64_t)value_;

- (NSNumber*)primitivePrevious;
- (void)setPrimitivePrevious:(NSNumber*)value;

- (BOOL)primitivePreviousValue;
- (void)setPrimitivePreviousValue:(BOOL)value_;

- (NSNumber*)primitiveRelated_event_id;
- (void)setPrimitiveRelated_event_id:(NSNumber*)value;

- (int64_t)primitiveRelated_event_idValue;
- (void)setPrimitiveRelated_event_idValue:(int64_t)value_;

- (NSDate*)primitiveUpdated_at;
- (void)setPrimitiveUpdated_at:(NSDate*)value;

- (LSEvent*)primitiveEvent;
- (void)setPrimitiveEvent:(LSEvent*)value;

@end
