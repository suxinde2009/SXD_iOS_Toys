//
//  ViewController2.m
//  StoryBoardPractiseDemo
//
//  Created by suxinde on 15/5/5.
//  Copyright (c) 2015年 Su XinDe. All rights reserved.
//

#import "ViewController2.h"

@implementation ViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", __func__);
}


@end
