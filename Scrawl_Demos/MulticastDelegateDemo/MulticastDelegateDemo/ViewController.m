//
//  ViewController.m
//  MulticastDelegateDemo
//
//  Created by suxinde on 15/6/18.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "ViewController.h"

#import "MockDownloadManager.h"
#import "MockDownloadProgressObserver.h"
#import "MockDownloadProgressObserver2.h"

@interface ViewController ()
{
    MockDownloadManager *md;
    MockDownloadProgressObserver *observer1;
    MockDownloadProgressObserver *observer2;
    
    MockDownloadProgressObserver *observer3;
    MockDownloadProgressObserver *observer4;
    
    float progress1;
    float progress2;
    
    NSTimer *mockDownloadingTimer1;
    NSTimer *mockDownloadingTimer2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initModels];
    [self initUI];
    
    [self mockDownloadings];
}

- (void)initModels
{
    md = [[MockDownloadManager alloc]init];
    observer1 = [[MockDownloadProgressObserver alloc] init];
    observer2 = [[MockDownloadProgressObserver alloc] init];
    
    observer3 = [[MockDownloadProgressObserver2 alloc] init];
    observer4 = [[MockDownloadProgressObserver2 alloc] init];
    
    [md addDelegate:observer1 delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    [md addDelegate:observer2 delegateQueue:dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT)];
    
    [md addDelegate:observer3 delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    [md addDelegate:observer4 delegateQueue:dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT)];
}


- (void)initUI
{
    self.progressLbl1.text = [NSString stringWithFormat:@"下载进度一： 0.0"];
    self.progressLbl2.text = [NSString stringWithFormat:@"下载进度二： 0.0"];
    
    self.progressView1.progress = 0.0f;
    self.progressView2.progress = 0.0f;
    
    self.progressView3.progress = 0.0f;
    self.progressView4.progress = 0.0f;
    
    observer1.progressView = self.progressView1;
    observer2.progressView = self.progressView2;
    
    observer3.progressView = self.progressView3;
    observer4.progressView = self.progressView4;
}



- (void)mockDownloading1:(id)sender
{
    if(!(progress1 > 1.0f)) {
        progress1 += 0.01f;
    }else {
        progress1 = 0.0f;
    }
    
    self.progressLbl1.text = [NSString stringWithFormat:@"下载进度一：%f", progress1];
    [md didUpdateProgeress:progress1 url:@"url1"];
}

- (void)mockDownloading2:(id)sender
{
    if(!(progress2 > 1.0f)) {
        progress2 += 0.01f;
    }else {
        progress2 = 0.0f;
    }
    
    self.progressLbl2.text = [NSString stringWithFormat:@"下载进度二：%f", progress2];
    [md didUpdateProgeress:progress2 url:@"url2"];
}

- (void)mockDownloadings
{
    mockDownloadingTimer1 = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(mockDownloading1:) userInfo:nil repeats:YES];

    mockDownloadingTimer2 = [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(mockDownloading2:) userInfo:nil repeats:YES];
    //+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;]
}


@end
