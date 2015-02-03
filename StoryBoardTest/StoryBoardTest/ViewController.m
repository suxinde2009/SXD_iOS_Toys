//
//  ViewController.m
//  StoryBoardTest
//
//  Created by su xinde on 15/2/3.
//  Copyright (c) 2015年 su. All rights reserved.
//

#import "ViewController.h"

#import "MyOperation.h"

// multiple thread
// http://www.apkbus.com/forum.php?mod=viewthread&tid=130128

// UIStoryBoard、 Size Class、Auto Layout
// http://onevcat.com/2013/12/code-vs-xib-vs-storyboard/
// http://www.cocoachina.com/ios/20140915/9623.html
// http://blog.csdn.net/yongyinmg/article/details/39315829

// http://blog.csdn.net/dwarven/article/details/37874141
// http://www.cocoachina.com/industry/20131203/7462.html
// http://www.cocoachina.com/industry/20131213/7537.html


// 怎样降低iOS代码耦合性
// http://segmentfault.com/blog/zsy78191/1190000002498637

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    NSLog(@"%s", __func__);
    
    
    // 方式一
    [NSThread detachNewThreadSelector:@selector(doSomethingInBackGround)
                             toTarget:self
                           withObject:nil];
    
    
    // 方式二
    NSThread *thread = [[NSThread alloc] initWithTarget:self 
                                               selector:@selector(doSomethingInBackGround2)
                                                 object:nil];
    [thread start];

    
    // 方式三
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    MyOperation *myTask = [[MyOperation alloc] init];
    [operationQueue addOperation:myTask];

    
    // 方式四
    NSOperationQueue *operationQueue2 = [[NSOperationQueue alloc] init];
    // 设置队列最大的操作数
    [operationQueue2 setMaxConcurrentOperationCount:1];
    
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                                      selector:@selector(doSomethingInBackGround3)
                                                                                        object:nil];
    [operationQueue2 addOperation:invocationOperation];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)doSomethingInBackGround
{
    @autoreleasepool {
        
        NSLog(@"%s: Thread is start...", __func__);
        NSLog(@"%s: Thread is running...", __func__);
        [NSThread sleepForTimeInterval:3];
        NSLog(@"%s: Thread is done...", __func__);
        
    }
    
}


- (void)doSomethingInBackGround2
{
    @autoreleasepool {
        
        NSLog(@"%s: Thread is start...", __func__);
        NSLog(@"%s: Thread is running...", __func__);
        [NSThread sleepForTimeInterval:3];
        NSLog(@"%s: Thread is done...", __func__);
        
    }
    
}


- (void)doSomethingInBackGround3
{
    @autoreleasepool {
        
        NSLog(@"%s: Thread is start...", __func__);
        NSLog(@"%s: Thread is running...", __func__);
        [NSThread sleepForTimeInterval:3];
        NSLog(@"%s: Thread is done...", __func__);
        
    }
    
}


- (IBAction)click1:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self presentViewController:[storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"] animated:YES completion:^{
        
    }];
}

- (IBAction)click2:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self presentViewController:[storyBoard instantiateViewControllerWithIdentifier:@"ThirdViewController"] animated:YES completion:^{
        
    }];
}

- (IBAction)click3:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self presentViewController:[storyBoard instantiateViewControllerWithIdentifier:@"FourthViewController"] animated:YES completion:^{
        
    }];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}


@end
