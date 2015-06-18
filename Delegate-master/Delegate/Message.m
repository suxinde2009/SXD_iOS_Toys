//
//  Message.m
//  Delegate
//
//  Created by zhangjunbo on 15/3/13.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import "Message.h"

@interface Message ()

@property (nonatomic, copy, readwrite) NSString *message;

@end

@implementation Message

- (instancetype)initWithMessage:(NSString *)message {
    if (self = [super init]) {
        _message = message;
    }
    
    return self;
}

@end
