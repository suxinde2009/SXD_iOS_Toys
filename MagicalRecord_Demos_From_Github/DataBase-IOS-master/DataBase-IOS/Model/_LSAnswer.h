// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSAnswer.h instead.

#import <CoreData/CoreData.h>

extern const struct LSAnswerAttributes {
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *current_id;
	__unsafe_unretained NSString *deleted_at;
	__unsafe_unretained NSString *event_id;
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *updated_at;
} LSAnswerAttributes;

extern const struct LSAnswerRelationships {
	__unsafe_unretained NSString *documents;
	__unsafe_unretained NSString *event;
} LSAnswerRelationships;

@class LSDocument;
@class LSEvent;

@interface LSAnswerID : NSManagedObjectID {}
@end

@interface _LSAnswer : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LSAnswerID* objectID;

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

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updated_at;

//- (BOOL)validateUpdated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *documents;

- (NSMutableSet*)documentsSet;

@property (nonatomic, strong) LSEvent *event;

//- (BOOL)validateEvent:(id*)value_ error:(NSError**)error_;

@end

@interface _LSAnswer (DocumentsCoreDataGeneratedAccessors)
- (void)addDocuments:(NSSet*)value_;
- (void)removeDocuments:(NSSet*)value_;
- (void)addDocumentsObject:(LSDocument*)value_;
- (void)removeDocumentsObject:(LSDocument*)value_;

@end

@interface _LSAnswer (CoreDataGeneratedPrimitiveAccessors)

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

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (NSDate*)primitiveUpdated_at;
- (void)setPrimitiveUpdated_at:(NSDate*)value;

- (NSMutableSet*)primitiveDocuments;
- (void)setPrimitiveDocuments:(NSMutableSet*)value;

- (LSEvent*)primitiveEvent;
- (void)setPrimitiveEvent:(LSEvent*)value;

@end
