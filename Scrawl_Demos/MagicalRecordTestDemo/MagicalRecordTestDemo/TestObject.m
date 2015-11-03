//
//  TestObject.m
//  MagicalRecordTestDemo
//
//  Created by suxinde on 15/6/15.
//  Copyright (c) 2015年 Su XinDe. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

- (id)copyWithZone:(NSZone *)zone
{
    TestObject *o = [[[self class] allocWithZone:zone] init];
    
    return o;
}

@end
