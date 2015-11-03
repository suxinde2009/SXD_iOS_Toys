//
//  MockDownloadProgressObserver.h
//  MulticastDelegateDemo
//
//  Created by suxinde on 15/6/18.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MockDownloadManager.h"

@interface MockDownloadProgressObserver : NSObject <MockDownloadManagerDownloadProgressDelegate>

@property (nonatomic, retain) UIProgressView *progressView;

@end
