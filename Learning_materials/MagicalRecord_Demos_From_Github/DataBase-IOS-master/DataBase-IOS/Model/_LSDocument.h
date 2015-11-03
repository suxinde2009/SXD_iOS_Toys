// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LSDocument.h instead.

#import <CoreData/CoreData.h>

extern const struct LSDocumentAttributes {
	__unsafe_unretained NSString *answer_id;
	__unsafe_unretained NSString *created_at;
	__unsafe_unretained NSString *current_id;
	__unsafe_unretained NSString *deleted_at;
	__unsafe_unretained NSString *justification;
	__unsafe_unretained NSString *updated_at;
	__unsafe_unretained NSString *url;
} LSDocumentAttributes;

extern const struct LSDocumentRelationships {
	__unsafe_unretained NSString *answer;
} LSDocumentRelationships;

@class LSAnswer;

@interface LSDocumentID : NSManagedObjectID {}
@end

@interface _LSDocument : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LSDocumentID* objectID;

@property (nonatomic, strong) NSNumber* answer_id;

@property (atomic) int64_t answer_idValue;
- (int64_t)answer_idValue;
- (void)setAnswer_idValue:(int64_t)value_;

//- (BOOL)validateAnswer_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* created_at;

//- (BOOL)validateCreated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* current_id;

@property (atomic) int64_t current_idValue;
- (int64_t)current_idValue;
- (void)setCurrent_idValue:(int64_t)value_;

//- (BOOL)validateCurrent_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* deleted_at;

//- (BOOL)validateDeleted_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* justification;

//- (BOOL)validateJustification:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* updated_at;

//- (BOOL)validateUpdated_at:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* url;

//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LSAnswer *answer;

//- (BOOL)validateAnswer:(id*)value_ error:(NSError**)error_;

@end

@interface _LSDocument (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveAnswer_id;
- (void)setPrimitiveAnswer_id:(NSNumber*)value;

- (int64_t)primitiveAnswer_idValue;
- (void)setPrimitiveAnswer_idValue:(int64_t)value_;

- (NSDate*)primitiveCreated_at;
- (void)setPrimitiveCreated_at:(NSDate*)value;

- (NSNumber*)primitiveCurrent_id;
- (void)setPrimitiveCurrent_id:(NSNumber*)value;

- (int64_t)primitiveCurrent_idValue;
- (void)setPrimitiveCurrent_idValue:(int64_t)value_;

- (NSDate*)primitiveDeleted_at;
- (void)setPrimitiveDeleted_at:(NSDate*)value;

- (NSString*)primitiveJustification;
- (void)setPrimitiveJustification:(NSString*)value;

- (NSDate*)primitiveUpdated_at;
- (void)setPrimitiveUpdated_at:(NSDate*)value;

- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;

- (LSAnswer*)primitiveAnswer;
- (void)setPrimitiveAnswer:(LSAnswer*)value;

@end
