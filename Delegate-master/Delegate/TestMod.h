//
//  TestMod.h
//  Delegate
//
//  Created by zhangjunbo on 15/3/13.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GCDMulticastDelegate;
@class Message;
@protocol MessageHanderDelegate;

@interface TestMod : NSObject

@property (nonatomic, strong) GCDMulticastDelegate<MessageHanderDelegate> *delegate;

- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;
- (void)removeDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

- (void)didReceivedMessage:(Message *)message;

@end

@protocol  MessageHanderDelegate

- (void)didReceivedMessage:(Message *)message;

@end






