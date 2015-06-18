//
//  TestLisener2.m
//  Delegate
//
//  Created by zhangjunbo on 15/3/13.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import "TestLisener2.h"
#import "Message.h"

@implementation TestLisener2

- (void)didReceivedMessage:(Message *)message {
     NSLog(@"%@ %s %@", message.message, __PRETTY_FUNCTION__, [NSThread currentThread]);
}

@end
