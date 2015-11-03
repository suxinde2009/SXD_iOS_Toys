//
//  KSViewController.m
//  KSTestApp
//
//  Created by kesalin on 30/4/13.
//  Copyright (c) 2013 kesalin@gmail.com. All rights reserved.
//

#import "KSViewController.h"
#import "KSTester.h"

@interface KSViewController ()
{
    id _observer;
}

@end

@implementation KSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    KSTester * tester = [[KSTester alloc] init];
    [tester run];
    
    __weak KSViewController * wself = self;
    _observer = [[NSNotificationCenter defaultCenter]
                 addObserverForName:@"TestNotificationKey"
                 object:nil queue:nil usingBlock:^(NSNotification *n) {
                     KSViewController * sself = wself;
                     if (sself) {
                         NSLog(@"%@", sself);
                     }
                     else {
                         NSLog(@"<self> dealloc before we could run this code.");
                     }
                 }];
}

- (void)dealloc
{
    if (_observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:_observer];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
