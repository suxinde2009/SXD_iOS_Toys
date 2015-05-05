//
//  ViewController.m
//  StoryBoardPractiseDemo
//
//  Created by suxinde on 15/5/5.
//  Copyright (c) 2015年 Su XinDe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)push2:(id)sender
{
    [self performSegueWithIdentifier:@"TestSuage" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __func__);
}


@end
