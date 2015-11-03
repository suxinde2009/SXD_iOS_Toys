//
//  ViewController.m
//  MagicalRecordTesting
//
//  Created by m0a on 2014/08/05.
//  Copyright (c) 2014年 m0a. All rights reserved.
//

#import "ViewController.h"
#import "Sample.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Sample* sample = [Sample MR_createEntity];
    sample.name = @"sample";
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    
    NSInteger cnt = [[Sample MR_findAll] count];
    self.label.text = [NSString stringWithFormat:@"このアプリは起動%d回目です。",cnt];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
