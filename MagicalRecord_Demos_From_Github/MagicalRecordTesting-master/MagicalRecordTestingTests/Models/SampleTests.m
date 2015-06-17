//
//  SampleTests.m
//  MagicalRecordTesting
//
//  Created by m0a on 2014/08/05.
//  Copyright (c) 2014年 m0a. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>
#import "Sample.h"

@interface SampleTests : XCTestCase

@end

@implementation SampleTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown
{
    [MagicalRecord cleanUp];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) createSamplesFromArray:(NSArray*)in_array
{
//    [NSManagedObjectContext MR_contextForCurrentThread];
    for (NSString* name in in_array) {
        Sample* sample = [Sample MR_createEntity];
        sample.name = name;
    }
    [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveToPersistentStoreAndWait];
    
}
-(void) testSampleAdd
{
    [NSManagedObjectContext MR_contextForCurrentThread];
    Sample* sample = [Sample MR_createEntity];
    sample.name = @"test";
    [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveToPersistentStoreAndWait];
    
    XCTAssertEqual([[Sample MR_findAll] count],1,@"Sample Create");
}

-(void) testSamplesAdd
{
    NSArray* data = @[@"a",@"b",@"c",@"d"];
    [self createSamplesFromArray:data];
    XCTAssertEqual([[Sample MR_findAll] count],[data count],@"Samples Create");
}
//- (void)testExample
//{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
//}

@end
