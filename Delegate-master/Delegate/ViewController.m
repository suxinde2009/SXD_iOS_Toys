//
//  ViewController.m
//  Delegate
//
//  Created by zhangjunbo on 15/3/13.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import "ViewController.h"
#import "TestMod.h"
#import "TestLisener1.h"
#import "TestLisener2.h"
#import "Message.h"

@interface ViewController ()

@property (nonatomic, strong) TestMod *mod;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _mod = [[TestMod alloc] init];
    
    TestLisener1 *lisener1 = [[TestLisener1 alloc] init];
    TestLisener2 *lisener2 = [[TestLisener2 alloc] init];
    
    [_mod addDelegate:lisener1 delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    [_mod addDelegate:lisener2 delegateQueue:dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT)];
    
    [_mod didReceivedMessage:[[Message alloc] initWithMessage:@"This is a test"]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClicked:(id)sender {
    
    
}

@end
