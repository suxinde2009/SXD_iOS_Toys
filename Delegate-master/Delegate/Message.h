//
//  Message.h
//  Delegate
//
//  Created by zhangjunbo on 15/3/13.
//  Copyright (c) 2015年 ZhangJunbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, copy, readonly) NSString *message;

- (instancetype)initWithMessage:(NSString *)message;

@end
