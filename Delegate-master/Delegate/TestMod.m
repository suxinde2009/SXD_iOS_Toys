//
//  TestMod.m
//  Delegate
//
//  Created by zhangjunbo on 15/3/13.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import "TestMod.h"
#import "GCDMulticastDelegate.h"
#import "Message.h"

@implementation TestMod

- (instancetype)init {
    if (self = [super init]) {
        _delegate = (GCDMulticastDelegate<MessageHanderDelegate> *)[[GCDMulticastDelegate alloc] init];
    }
    
    return self;
}

- (void)didReceivedMessage:(Message *)message {
    NSLog(@"%@ %s %@", message.message, __PRETTY_FUNCTION__, [NSThread currentThread]);
    [self.delegate didReceivedMessage:message];
}

- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue
{
//    dispatch_block_t block = ^{
        [_delegate addDelegate:delegate delegateQueue:delegateQueue];
//    };
//    
//    block();
}

- (void)removeDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue
{
//    dispatch_block_t block = ^{
        [_delegate removeDelegate:delegate delegateQueue:delegateQueue];
//    };
//    
//    block();
}

@end
