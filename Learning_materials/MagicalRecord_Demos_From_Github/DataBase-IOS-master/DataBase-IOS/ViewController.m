//
//  ViewController.m
//  DataBase-IOS
//
//  Created by Artur on 12/11/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import "ViewController.h"
#import "LSDocument.h"
#import "LSEvent.h"
#import "NSDate+Convertion.h"

@interface ViewController ()

@property (nonatomic, strong) LSDocument *document;
@property (nonatomic, strong) LSEvent *event;

@end

@implementation ViewController


#pragma mark - life cycle

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

//created_at
//deleted_at
//event_id
//id
//justification
//updated_at
//url

//- (Entity*)createEntity:(NSString*)id{
//    Entity * entity = [Entity MR_findFirstByAttribute:@"id" withValue:id];
//    if(! entity){
//        Entity * newEntity = [Entity MR_createEntity];
//        [newEntity setId:id];
//        entity = newEntity
//    }
//    return entity
//}

#pragma mark - Actions

//- (LSDocument *) createEntityWithDict:(NSDictionary *)dict
//{
//    LSDocument *document = [LSDocument MR_findFirstByAttribute:@"current_id" withValue:dict.current_id];
//    
//    if (!document)
//    {
//        //Mapping
//        
//        //Saving
//        [localContext MR_saveOnlySelfAndWait];
//    }
//}

- (IBAction)actionAddFirstDocument:(id)sender
{
    //Не добавлять повторяющиеся:
    LSDocument *doc =[LSDocument MR_findFirstByAttribute:@"current_id" withValue:@91];
    
    NSArray *docs = [LSDocument MR_findByAttribute:@"current_id" withValue:@91];
    
    
    NSLog(@"\n\n");
    NSLog(@" LSDocument doc");
    NSLog(@" current_id %@", doc.current_id);
    //NSLog(@" event_id %@", doc.event_id);
    NSLog(@" justification %@", doc.justification);
    NSLog(@" url %@", doc.url);
    
    NSLog(@" created at %@", doc.created_at);
    NSLog(@" updated at %@", doc.updated_at);
    
    
    //[self logDocument:doc];
    
    if (!docs) {
        
        //Добавляем объект в базу:
        NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
        
        self.document = [LSDocument MR_createInContext:localContext];
        
        self.document.current_id = @91;
        //self.document.event_id = @11;
        self.document.justification = @"Тест-полоски";
        self.document.url = @"uploads/тест-полоски.pdf";
        
        NSDate *created_at = [NSDate convertFullDateFromString:@"2014-10-31 12:34:56 +0300"];
        
        NSDate *updated_at = [NSDate convertFullDateFromString:@"2014-10-31 12:36:27 +0300"];
        
        self.document.created_at = created_at;
        self.document.updated_at = updated_at;
        
        [localContext MR_saveOnlySelfAndWait];
        
    }
    
}

- (IBAction)actionFetchDocuments:(id)sender {
    
    NSArray *documents = [LSDocument MR_findAll];
    
    for (LSDocument *doc in documents) {
        NSLog(@"\n\n");
        NSLog(@" LSDocument doc");
        NSLog(@" current_id %@", doc.current_id);
        //NSLog(@" event_id %@", doc.event_id);
        NSLog(@" justification %@", doc.justification);
        NSLog(@" url %@", doc.url);
        
        NSLog(@" created at %@", doc.created_at);
        NSLog(@" updated at %@", doc.updated_at);
        
    }
}

- (void)logDocument:(LSDocument *)doc
{
    NSLog(@"\n\n");
    NSLog(@" LSDocument doc");
    NSLog(@" current_id %@", doc.current_id);
    //NSLog(@" event_id %@", doc.event_id);
    NSLog(@" justification %@", doc.justification);
    NSLog(@" url %@", doc.url);
    
    NSLog(@" created at %@", doc.created_at);
    NSLog(@" updated at %@", doc.updated_at);
}

- (IBAction)actionAddEvent:(id)sender
{
    
}

- (IBAction)actionFetchEvents:(id)sender
{
    
}

- (IBAction)actionDeleteDocuments:(id)sender
{
    
}

- (IBAction)actionDeleteEvents:(id)sender
{
    
}

//"created_at": "2014-10-31 12:34:56 +0300",
//"updated_at": "2014-10-31 12:36:27 +0300",

//// Get the local context
//NSManagedObjectContext *localContext    = [NSManagedObjectContext MR_contextForCurrentThread];
//
//// Create a new Person in the current thread context
//Person *person                          = [Person MR_createInContext:localContext];
//person.firstname                        = firstname;
//person.lastname                         = lastname;
//person.age                              = age;
//
//// Save the modification in the local context
//// With MagicalRecords 2.0.8 or newer you should use the MR_saveNestedContexts
//[localContext MR_save];

- (IBAction)actionAddSecondDocument:(id)sender
{
    NSString *myString = @"2010-10-10 10:10:10 +0300";
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    NSDate *yourDate = [dateFormatter dateFromString:myString];
    
    //dateFormatter.dateFormat = @"dd-MMM-yyyy";
    NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
}


- (IBAction)FetchAllDocumentsFromBigJSON:(id)sender
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ls" ofType:@"json"];
    
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSData *allDocumentsData = [[NSData alloc] initWithContentsOfURL:url];
    
    
    NSError *error;
    NSMutableDictionary *allDocuments =
    [NSJSONSerialization JSONObjectWithData:allDocumentsData options:NSJSONReadingMutableContainers error:&error];
    

    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    else
    {
        NSDictionary *createsDict = allDocuments[@"creates"];
        
        NSArray *documents = createsDict[@"documents"];
        
        //NSLog(@"\n\n documents = %@", documents);
        
        for (NSDictionary *dict in documents) {
            
            NSLog(@"\n\n");
            NSLog(@"url = %@", dict[@"url"]);
            
            NSString *str = dict[@"url"];
            
            NSString *encodedStr = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSLog(@"str = %@", encodedStr);
            
            
        }
        
    }

}



@end
