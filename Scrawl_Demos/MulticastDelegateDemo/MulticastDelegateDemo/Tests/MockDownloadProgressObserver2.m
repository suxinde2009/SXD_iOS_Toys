//
//  MockDownloadProgressObserver2.m
//  MulticastDelegateDemo
//
//  Created by suxinde on 15/6/18.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "MockDownloadProgressObserver2.h"

@implementation MockDownloadProgressObserver2

- (void)didUpdateProgeress:(float)progerss url:(NSString *)url
{
    if ([url isEqualToString:@"url2"]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.progressView) {
                self.progressView.progress = progerss;
            }
        });
    }
}

@end
