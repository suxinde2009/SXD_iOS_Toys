//
//  MyOperation.m
//  StoryBoardTest
//
//  Created by su xinde on 15/2/3.
//  Copyright (c) 2015年 su. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation

- (void)main
{
    NSLog(@"%s: Thread is start...", __func__);
    NSLog(@"%s: Thread is running...", __func__);
    [NSThread sleepForTimeInterval:3];
    NSLog(@"%s: Thread is done...", __func__);
}

@end
