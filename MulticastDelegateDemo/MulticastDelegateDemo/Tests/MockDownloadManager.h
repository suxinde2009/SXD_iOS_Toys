//
//  MockDownloadManager.h
//  MulticastDelegateDemo
//
//  Created by suxinde on 15/6/18.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDMulticastDelegate.h"

@protocol MockDownloadManagerDownloadProgressDelegate;

@interface MockDownloadManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) GCDMulticastDelegate<MockDownloadManagerDownloadProgressDelegate> *delegate;

- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;
- (void)removeDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

- (void)didUpdateProgeress:(float)progerss url:(NSString *)url;

@end


@protocol  MockDownloadManagerDownloadProgressDelegate

- (void)didUpdateProgeress:(float)progerss url:(NSString *)url;

@end