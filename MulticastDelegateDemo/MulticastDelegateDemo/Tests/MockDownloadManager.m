//
//  MockDownloadManager.m
//  MulticastDelegateDemo
//
//  Created by suxinde on 15/6/18.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "MockDownloadManager.h"

@implementation MockDownloadManager

+ (instancetype)sharedInstance
{
    static MockDownloadManager *__sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        __sharedInstance = [[MockDownloadManager alloc] init];
    });
    
    return __sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _delegate = (GCDMulticastDelegate<MockDownloadManagerDownloadProgressDelegate> *)[[GCDMulticastDelegate alloc] init];
    }
    
    return self;
}

- (void)didUpdateProgeress:(float)progerss url:(NSString *)url {
    NSLog(@"%s: %@ %f, %@", __PRETTY_FUNCTION__, url, progerss, [NSThread currentThread]);
    [self.delegate didUpdateProgeress:progerss url:url];
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
