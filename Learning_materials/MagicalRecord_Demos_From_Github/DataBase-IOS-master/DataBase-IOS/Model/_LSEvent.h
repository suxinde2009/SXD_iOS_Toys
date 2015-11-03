// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSEvent.h instead.

#import <CoreData/CoreData.h>

extern const struct LSEventAttributes {
	__unsafe_unretained NSString *access_count;
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *current_id;
	__unsafe_unretained NSString *deleted_at;
	__unsafe_unretained NSString *event_kind_id;
	__unsafe_unretained NSString *event_type_id;
	__unsafe_unretained NSString *formulation;
	__unsafe_unretained NSString *frequency;
	__unsafe_unretained NSString *interlocutor_id;
	__unsafe_unretained NSString *update_at;
} LSEventAttributes;

extern const struct LSEventRelationships {
	__unsafe_unretained NSString *answer;
	__unsafe_unretained NSString *event_tags;
	__unsafe_unretained NSString *related_events;
} LSEventRelationships;

@class LSAnswer;
@class LSEventTag;
@class LSRelatedEvent;

@interface LSEventID : NSManagedObjectID {}
@end

@interface _LSEvent : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LSEventID* objectID;

@property (nonatomic, strong) NSNumber* access_count;

@property (atomic) int64_t access_countValue;
- (int64_t)access_countValue;
- (void)setAccess_countValue:(int64_t)value_;

//- (BOOL)validateAccess_count:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* created_at;

//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* current_id;

@property (atomic) int64_t current_idValue;
- (int64_t)current_idValue;
- (void)setCurrent_idValue:(int64_t)value_;

//- (BOOL)validateCurrent_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* deleted_at;

//- (BOOL)validateDeleted_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* event_kind_id;

@property (atomic) int16_t event_kind_idValue;
- (int16_t)event_kind_idValue;
- (void)setEvent_kind_idValue:(int16_t)value_;

//- (BOOL)validateEvent_kind_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* event_type_id;

@property (atomic) int16_t event_type_idValue;
- (int16_t)event_type_idValue;
- (void)setEvent_type_idValue:(int16_t)value_;

//- (BOOL)validateEvent_type_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* formulation;

//- (BOOL)validateFormulation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* frequency;

@property (atomic) int64_t frequencyValue;
- (int64_t)frequencyValue;
- (void)setFrequencyValue:(int64_t)value_;

//- (BOOL)validateFrequency:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* interlocutor_id;

@property (atomic) int16_t interlocutor_idValue;
- (int16_t)interlocutor_idValue;
- (void)setInterlocutor_idValue:(int16_t)value_;

//- (BOOL)validateInterlocutor_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* update_at;

//- (BOOL)validateUpdate_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LSAnswer *answer;

//- (BOOL)validateAnswer:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *event_tags;

- (NSMutableSet*)event_tagsSet;

@property (nonatomic, strong) NSSet *related_events;

- (NSMutableSet*)related_eventsSet;

@end

@interface _LSEvent (Event_tagsCoreDataGeneratedAccessors)
- (void)addEvent_tags:(NSSet*)value_;
- (void)removeEvent_tags:(NSSet*)value_;
- (void)addEvent_tagsObject:(LSEventTag*)value_;
- (void)removeEvent_tagsObject:(LSEventTag*)value_;

@end

@interface _LSEvent (Related_eventsCoreDataGeneratedAccessors)
- (void)addRelated_events:(NSSet*)value_;
- (void)removeRelated_events:(NSSet*)value_;
- (void)addRelated_eventsObject:(LSRelatedEvent*)value_;
- (void)removeRelated_eventsObject:(LSRelatedEvent*)value_;

@end

@interface _LSEvent (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAccess_count;
- (void)setPrimitiveAccess_count:(NSNumber*)value;

- (int64_t)primitiveAccess_countValue;
- (void)setPrimitiveAccess_countValue:(int64_t)value_;

- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;

- (NSNumber*)primitiveCurrent_id;
- (void)setPrimitiveCurrent_id:(NSNumber*)value;

- (int64_t)primitiveCurrent_idValue;
- (void)setPrimitiveCurrent_idValue:(int64_t)value_;

- (NSDate*)primitiveDeleted_at;
- (void)setPrimitiveDeleted_at:(NSDate*)value;

- (NSNumber*)primitiveEvent_kind_id;
- (void)setPrimitiveEvent_kind_id:(NSNumber*)value;

- (int16_t)primitiveEvent_kind_idValue;
- (void)setPrimitiveEvent_kind_idValue:(int16_t)value_;

- (NSNumber*)primitiveEvent_type_id;
- (void)setPrimitiveEvent_type_id:(NSNumber*)value;

- (int16_t)primitiveEvent_type_idValue;
- (void)setPrimitiveEvent_type_idValue:(int16_t)value_;

- (NSString*)primitiveFormulation;
- (void)setPrimitiveFormulation:(NSString*)value;

- (NSNumber*)primitiveFrequency;
- (void)setPrimitiveFrequency:(NSNumber*)value;

- (int64_t)primitiveFrequencyValue;
- (void)setPrimitiveFrequencyValue:(int64_t)value_;

- (NSNumber*)primitiveInterlocutor_id;
- (void)setPrimitiveInterlocutor_id:(NSNumber*)value;

- (int16_t)primitiveInterlocutor_idValue;
- (void)setPrimitiveInterlocutor_idValue:(int16_t)value_;

- (NSDate*)primitiveUpdate_at;
- (void)setPrimitiveUpdate_at:(NSDate*)value;

- (LSAnswer*)primitiveAnswer;
- (void)setPrimitiveAnswer:(LSAnswer*)value;

- (NSMutableSet*)primitiveEvent_tags;
- (void)setPrimitiveEvent_tags:(NSMutableSet*)value;

- (NSMutableSet*)primitiveRelated_events;
- (void)setPrimitiveRelated_events:(NSMutableSet*)value;

@end
