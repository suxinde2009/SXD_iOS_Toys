//
//  EventsController.m
//  DataBase-IOS
//
//  Created by Artur on 16/11/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import "EventsController.h"

#import "LSEvent.h"
#import "LSAnswer.h"
#import "LSDocument.h"
#import "LSEventTag.h"
#import "LSTag.h"
#import "LSRelatedEvent.h"

#import "NSDate+Convertion.h"
#import "SVProgressHUD.h"
#import <QuartzCore/QuartzCore.h>
#import "NSDictionary+Workers.h"
#import "NSDate+Convertion.h"

@interface EventsController ()

@property (nonatomic, strong) LSDocument *document;
@property (nonatomic, strong) LSEvent *event;
@property (nonatomic, strong) LSAnswer *answer;

@end

@implementation EventsController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Actions
- (IBAction)actionDisplayData:(id)sender
{
    [SVProgressHUD showWithStatus:@"Загрузка данных"];
    [self displayData];
}
- (IBAction)actionParseJson:(id)sender
{
    //[SVProgressHUD showWithStatus:@"Загрузка данных"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ls" ofType:@"json"];
    [self mappingJsonFromFilePath:path withCallback:^(BOOL isParsed) {
        NSLog(@"\n\n JSON MAPPED!");
        //[SVProgressHUD dismiss];
    }];
}
- (IBAction)actionDownloadJson:(id)sender
{
    [SVProgressHUD showWithStatus:@"Download File"];
    [self downloadJsonWithCallback:^(NSString *filePath) {
        
         NSLog(@"\n\n JSON DOWNLOADED!");
        
        [SVProgressHUD showWithStatus:@"Mapping File"];
        [self mappingJsonFromFilePath:filePath withCallback:^(BOOL isParsed) {
            
           
            NSLog(@"\n\n JSON MAPPED!");
            
            [SVProgressHUD dismiss];
        }];
    }];
    
}

#pragma mark - Download Json

- (void)downloadJsonWithCallback:(void(^)(NSString *filePath))callback
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSString *stringURL = @"http://lifescan.racoons-group.com/api/v1/updates";
        
        NSURL *url = [NSURL URLWithString:stringURL];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        
        NSString  *filePath;
        if (urlData)
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];

            filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"lifescan.json"];
            
            //NSURL *url = [NSURL fileURLWithPath:filePath];
            //self.pathUrl =url;
            
            [urlData writeToFile:filePath atomically:YES];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            callback(filePath);
            
            //[SVProgressHUD dismiss];
        });
    });
    
}

#pragma mark - Mapping Methods
- (void)mappingJsonFromFilePath:(NSString *)filePath withCallback:(void(^)(BOOL isParsed))callback
{
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"ls" ofType:@"json"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    NSError *error;
    NSMutableDictionary *allData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if(error) {
        NSLog(@"ERROR IN PARSING: %@", [error localizedDescription]);
    }
    
    //"creates"
    NSDictionary *createsDict = allData[@"creates"];
    
    NSArray *events = createsDict[@"events"];        //"events":
    NSArray *answers = createsDict[@"answers"];      //"answers":
    NSArray *documents = createsDict[@"documents"];  //"documents":
    
    NSArray *related_events = createsDict[@"related_events"];  //"related_events":
    NSArray *event_tags = createsDict[@"event_tags"];          //"event_tags":
    NSArray *tags = createsDict[@"tags"];                      //"tags":
    
    
    //[SVProgressHUD showWithStatus:@"Загрузка данных"];
    //[SVProgressHUD show];
    
    //CONTEXT
    //NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        for (NSDictionary *dict in events) {
            
            //EVENTS
            LSEvent *event = [LSEvent MR_createInContext:localContext];
            event.current_id      = @([dict[@"id"] integerValue]);
            event.interlocutor_id = @([dict[@"interlocutor_id"] integerValue]);
            event.event_type_id   = @([dict[@"event_type_id"] integerValue]);
            event.event_kind_id   = @([dict[@"event_kind_id"] integerValue]);
            event.formulation     = dict[@"formulation"];
            event.access_count    = @([dict[@"access_count"] integerValue]);
            event.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
            event.update_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
            if (!([dict[@"deleted_at"] isEqual: [NSNull null]])) {
                event.deleted_at = [NSDate convertFullDateFromString:dict[@"deleted_at"]];
            }
            for (NSDictionary *dict in answers)
            {
                if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
                {
                    //ANSWERS
                    LSAnswer *answer = [LSAnswer MR_createInContext:localContext];
                    answer.current_id = @([dict[@"id"] integerValue]);
                    answer.event_id = @([dict[@"event_id"] integerValue]);
                    answer.text = dict[@"text"];
                    answer.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                    answer.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                    
                    event.answer = answer;
                    
                    for (NSDictionary *dict in documents)
                    {
                        NSNumber *answerIdInAnswer = event.answer.current_id;
                        NSNumber *answerIdInDocument = [dict objectForKeyOrNil:@"answer_id"];
                        
                        if ((answerIdInAnswer != nil) && (answerIdInDocument != nil) && ([answerIdInAnswer isEqualToNumber: answerIdInDocument]))
                        {
                            //DOCUMENTS
                            LSDocument *document = [LSDocument MR_createInContext:localContext];
                            document.current_id = @([dict[@"id"] integerValue]);
                            document.answer_id = @([dict[@"answer_id"] integerValue]);
                            document.justification = [dict objectForKeyOrNil:@"justification"]; //dict[@"justification"];
                            document.url = dict[@"url"];
                            document.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                            document.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                            
                            [answer addDocumentsObject:document];
                        }
                    }
                }
            }
            for (NSDictionary *dict in event_tags)
            {
                if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
                {
                    LSEventTag *eventTag = [LSEventTag MR_createInContext:localContext];
                    
                    eventTag.current_id = @([dict[@"id"] integerValue]);
                    eventTag.event_id = @([dict[@"event_id"] integerValue]);
                    eventTag.tag_id = @([dict[@"tag_id"] integerValue]);
                    
                    eventTag.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                    eventTag.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                    
                    [event addEvent_tagsObject:eventTag];
                    
                    for (NSDictionary *dict in tags)
                    {
                        if ([eventTag.tag_id isEqualToNumber: @([dict[@"id"] integerValue])])
                        {
                            LSTag *tag = [LSTag MR_createInContext:localContext];
                            
                            tag.current_id = @([dict[@"id"] integerValue]);
                            tag.name = dict[@"name"];
                            
                            tag.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                            tag.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                            
                            eventTag.tag = tag;
                        }
                    }
                }
            }
            
            for (NSDictionary *dict in related_events)
            {
                if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
                {
                    LSRelatedEvent *relatedEvent = [LSRelatedEvent MR_createInContext:localContext];
                    
                    relatedEvent.current_id = @([dict[@"id"] integerValue]);
                    relatedEvent.event_id = @([dict[@"event_id"] integerValue]);
                    relatedEvent.related_event_id =  @([dict[@"related_event_id"] integerValue]);
                    
                    relatedEvent.previous = @([dict[@"previous"] integerValue]);
                    relatedEvent.frequency = @([dict[@"frequency"] integerValue]);
                    
                    relatedEvent.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                    relatedEvent.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                    
                    [event addRelated_eventsObject:relatedEvent];
                    
                    //event.related_event = relatedEvent;
                }
            }
            //[localContext MR_saveOnlySelfAndWait];
        }
        
    } completion:^(BOOL success, NSError *error) {
        NSLog(@"\n\n SAVING COMPLETE");
        
        callback(YES);
        [SVProgressHUD dismiss];
    }];
    
    
    
}

//- (void)mappingJsonFromFilePath:(NSString *)filePath withCallback:(void(^)(BOOL isParsed))callback
//{
//    NSURL *url = [NSURL fileURLWithPath:pathString];
//    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
//    
//    NSError *error;
//    NSMutableDictionary *allData =
//    [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//    
//    //CONTEXT
//    //NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
//    
//    if(error) {
//        NSLog(@"%@", [error localizedDescription]);
//    }
//    else
//    {
//        NSDictionary *createsDict = allData[@"creates"]; //"creates"
//        
//        NSArray *events = createsDict[@"events"];        //"events":
//        NSArray *answers = createsDict[@"answers"];      //"answers":
//        NSArray *documents = createsDict[@"documents"];  //"documents":
//        
//        NSArray *related_events = createsDict[@"related_events"];  //"related_events":
//        NSArray *event_tags = createsDict[@"event_tags"];          //"event_tags":
//        NSArray *tags = createsDict[@"tags"];                      //"tags":
//        
//        //[SVProgressHUD showWithStatus:@"Загрузка данных"];
//        
//        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
//            
//            for (NSDictionary *dict in events)
//            {
//                //Events
//                LSEvent *event = [LSEvent MR_createInContext:localContext];
//                event.current_id      = @([dict[@"id"] integerValue]);
//                event.interlocutor_id = @([dict[@"interlocutor_id"] integerValue]);
//                event.event_type_id   = @([dict[@"event_type_id"] integerValue]);  //dict[@"event_type_id"];
//                event.event_kind_id   = @([dict[@"event_kind_id"] integerValue]); //dict[@"event_kind_id"];
//                event.formulation     = dict[@"formulation"]; //dict[@"formulation"];
//                event.access_count    = @([dict[@"access_count"] integerValue]); //dict[@"access_count"];
//                event.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
//                event.update_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
//                if (![dict[@"deleted_at"] isEqual: [NSNull null]]) {
//                    event.deleted_at = [NSDate convertFullDateFromString:dict[@"deleted_at"]];
//                }
//                for (NSDictionary *dict in answers)
//                {
//                    if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
//                    {
//                        LSAnswer *answer = [LSAnswer MR_createInContext:localContext];
//                        
//                        answer.current_id = @([dict[@"id"] integerValue]);
//                        answer.event_id = @([dict[@"event_id"] integerValue]);
//                        answer.text = dict[@"text"];
//                        
//                        answer.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
//                        answer.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
//                        
//                        event.answer = answer;
//                        
//                        for (NSDictionary *dict in documents)
//                        {
//                            if ([event.answer.current_id isEqualToNumber: @([dict[@"answer_id"] integerValue])])
//                            {
//                                LSDocument *document = [LSDocument MR_createInContext:localContext];
//                                
//                                document.current_id = @([dict[@"id"] integerValue]);
//                                document.answer_id = @([dict[@"answer_id"] integerValue]);
//                                //document.justification = dict[@"justification"];
//                                document.url = dict[@"url"];
//                                
//                                document.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
//                                document.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
//                                
//                                [answer addDocumentsObject:document];
//                            }
//                        }
//                    }
//                }
//                for (NSDictionary *dict in event_tags)
//                {
//                    if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
//                    {
//                        LSEventTag *eventTag = [LSEventTag MR_createInContext:localContext];
//                        
//                        eventTag.current_id = @([dict[@"id"] integerValue]);
//                        eventTag.event_id = @([dict[@"event_id"] integerValue]);
//                        eventTag.tag_id = @([dict[@"tag_id"] integerValue]);
//                        
//                        eventTag.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
//                        eventTag.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
//                        
//                        [event addEvent_tagsObject:eventTag];
//                        
//                        for (NSDictionary *dict in tags)
//                        {
//                            if ([eventTag.tag_id isEqualToNumber: @([dict[@"id"] integerValue])])
//                            {
//                                LSTag *tag = [LSTag MR_createInContext:localContext];
//                                
//                                tag.current_id = @([dict[@"id"] integerValue]);
//                                tag.name = dict[@"name"];
//                                
//                                tag.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
//                                tag.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
//                                
//                                eventTag.tag = tag;
//                            }
//                        }
//                    }
//                }
//                for (NSDictionary *dict in related_events)
//                {
//                    if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
//                    {
//                        LSRelatedEvent *relatedEvent = [LSRelatedEvent MR_createInContext:localContext];
//                        
//                        relatedEvent.current_id = @([dict[@"id"] integerValue]);
//                        relatedEvent.event_id = @([dict[@"event_id"] integerValue]);
//                        relatedEvent.related_event_id =  @([dict[@"related_event_id"] integerValue]);
//                        
//                        relatedEvent.previous = @([dict[@"previous"] integerValue]);
//                        relatedEvent.frequency = @([dict[@"frequency"] integerValue]);
//                        
//                        relatedEvent.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
//                        relatedEvent.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
//                        
//                        [event addRelated_eventsObject:relatedEvent];
//                        
//                        //event.related_event = relatedEvent;
//                    }
//                }
//                //[localContext MR_saveOnlySelfAndWait];
//            }
//        }
//         completion:^(BOOL success, NSError *error) {
//            NSLog(@"\n\n SAVING COMPLETE");
//            
//            callback(YES);
//            [SVProgressHUD dismiss];
//         }];
//        
//    }
//}


- (void)parseJson
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"96-updated" ofType:@"json"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    NSError *error;
    NSMutableDictionary *allData =
    [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    //CONTEXT
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    if(error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    else
    {
        NSDictionary *createsDict = allData[@"creates"]; //"creates"
        
        NSArray *events = createsDict[@"events"];        //"events":
        NSArray *answers = createsDict[@"answers"];      //"answers":
        NSArray *documents = createsDict[@"documents"];  //"documents":
        
        NSArray *related_events = createsDict[@"related_events"];  //"related_events":
        NSArray *event_tags = createsDict[@"event_tags"];          //"event_tags":
        NSArray *tags = createsDict[@"tags"];                      //"tags":
        
        for (NSDictionary *dict in events) {
            
            //Events
            LSEvent *event = [LSEvent MR_createInContext:localContext];
            event.current_id      = @([dict[@"id"] integerValue]);
            event.interlocutor_id = @([dict[@"interlocutor_id"] integerValue]);
            event.event_type_id   = @([dict[@"event_type_id"] integerValue]);  //dict[@"event_type_id"];
            event.event_kind_id   = @([dict[@"event_kind_id"] integerValue]); //dict[@"event_kind_id"];
            event.formulation     = dict[@"formulation"]; //dict[@"formulation"];
            event.access_count    = @([dict[@"access_count"] integerValue]); //dict[@"access_count"];
            event.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
            event.update_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
            if (![dict[@"deleted_at"] isEqual: [NSNull null]]) {
                event.deleted_at = [NSDate convertFullDateFromString:dict[@"deleted_at"]];
            }
            
            for (NSDictionary *dict in answers)
            {
                if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
                {
                    LSAnswer *answer = [LSAnswer MR_createInContext:localContext];
                    
                    answer.current_id = @([dict[@"id"] integerValue]);
                    answer.event_id = @([dict[@"event_id"] integerValue]);
                    answer.text = dict[@"text"];
                    
                    answer.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                    answer.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                    
                    event.answer = answer;
                    
                    for (NSDictionary *dict in documents)
                    {
                        if ([event.answer.current_id isEqualToNumber: @([dict[@"answer_id"] integerValue])])
                        {
                            LSDocument *document = [LSDocument MR_createInContext:localContext];
                            
                            document.current_id = @([dict[@"id"] integerValue]);
                            document.answer_id = @([dict[@"answer_id"] integerValue]);
                            //document.justification = dict[@"justification"];
                            document.url = dict[@"url"];
                            
                            document.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                            document.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                            
                            [answer addDocumentsObject:document];
                        }
                    }
                }
            }
            
            for (NSDictionary *dict in event_tags)
            {
                if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
                {
                    LSEventTag *eventTag = [LSEventTag MR_createInContext:localContext];
                    
                    eventTag.current_id = @([dict[@"id"] integerValue]);
                    eventTag.event_id = @([dict[@"event_id"] integerValue]);
                    eventTag.tag_id = @([dict[@"tag_id"] integerValue]);
                    
                    eventTag.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                    eventTag.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                    
                    [event addEvent_tagsObject:eventTag];
                    
                    for (NSDictionary *dict in tags)
                    {
                        if ([eventTag.tag_id isEqualToNumber: @([dict[@"id"] integerValue])])
                        {
                            LSTag *tag = [LSTag MR_createInContext:localContext];
                            
                            tag.current_id = @([dict[@"id"] integerValue]);
                            tag.name = dict[@"name"];
                            
                            tag.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                            tag.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                            
                            eventTag.tag = tag;
                            
                        }
                    }
                }
            }
            
            for (NSDictionary *dict in related_events)
            {
                if ([event.current_id isEqualToNumber: @([dict[@"event_id"] integerValue])])
                {
                    LSRelatedEvent *relatedEvent = [LSRelatedEvent MR_createInContext:localContext];
                    
                    relatedEvent.current_id = @([dict[@"id"] integerValue]);
                    relatedEvent.event_id = @([dict[@"event_id"] integerValue]);
                    relatedEvent.related_event_id =  @([dict[@"related_event_id"] integerValue]);
                    
                    relatedEvent.previous = @([dict[@"previous"] integerValue]);
                    relatedEvent.frequency = @([dict[@"frequency"] integerValue]);
                    
                    relatedEvent.created_at = [NSDate convertFullDateFromString:dict[@"created_at"]];
                    relatedEvent.updated_at = [NSDate convertFullDateFromString:dict[@"updated_at"]];
                    
                    [event addRelated_eventsObject:relatedEvent];
                    
                    //event.related_event = relatedEvent;
                }
            }
            [localContext MR_saveOnlySelfAndWait];
        }
    }
}


#pragma mark - Хрень

- (NSNumber *)numberFromBooleanString:(NSString *)booleanString
{
    if ([booleanString isEqualToString:@"true"]) {
        return @1;
    }
    else {
        return @0;
    }
}




#pragma mark - Display Data

- (void)displayData
{
    NSArray *events = [LSEvent MR_findAll];
    
    for (LSEvent *event in events) {
        
        NSLog(@"\n\n");
        NSLog(@"current_id = %@", event.current_id);
        NSLog(@"interlocutor_id = %@", event.interlocutor_id);
        NSLog(@"event_type_id = %@", event.event_type_id);
        NSLog(@"event_kind_id = %@", event.event_kind_id);
        
        NSLog(@"formulation = %@", event.formulation);
        
        NSLog(@"access_count = %@", event.access_count);
        NSLog(@"created_at = %@", event.created_at);
        NSLog(@"updated_at = %@", event.update_at);
        NSLog(@"deleted_at = %@", event.deleted_at);
        
        NSLog(@"\nevent = %@", event);
        NSLog(@"\nanswer = %@", event.answer);
        NSLog(@"\ndocuments = %@", event.answer.documents);
        
        NSArray *docs = [event.answer.documents allObjects];
        NSLog(@"event.answer.documents = %@", docs);
        
        NSLog(@"\n answer.text = %@", event.answer.text);
        
        LSDocument *doc = [[event.answer.documents allObjects] firstObject];
        NSLog(@"\n document.url = %@",doc.url);
        NSLog(@"\n documents count = %@", [event.answer.documents allObjects]);
        
        LSEventTag *event_tag = [[event.event_tags allObjects] firstObject];
        NSLog(@"\n event_tag.tag_id = %@",event_tag.tag_id);
        NSLog(@"\n event_tag.tag = %@", event_tag.tag);
        NSLog(@"\n event_tag = %@", event_tag);
        NSLog(@"\n tag.name = %@", event_tag.tag.name);
        
        LSTag *tag = event_tag.tag;
        NSLog(@"\n tag = %@", tag);
        NSLog(@"\n tag.name = %@", tag.name);
        
        NSArray *related_events = [event.related_events allObjects];
        NSLog(@"\n related_events = %@", related_events);
        //NSLog(@"\n related_event = %@", event.related_event);
    }
    
    NSArray *arr = [LSEvent MR_findByAttribute:@"current_id" withValue:@(96)];
    LSEvent *ev = [arr firstObject];
}

@end
