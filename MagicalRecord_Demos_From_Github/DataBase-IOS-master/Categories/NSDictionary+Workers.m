//
//  NSDictionary+Workers.m
//  LifeScan
//
//  Created by Artur on 19/11/14.
//  Copyright (c) 2014 Racoons Group. All rights reserved.
//

#import "NSDictionary+Workers.h"

@implementation NSDictionary (Workers)

- (id)objectForKeyOrDefault:(id)aKey aDefault:(id)aDefault {
    id obj = [self objectForKey:aKey];
    
    return (! obj || obj == [NSNull null]) ? aDefault : obj;
}

- (id)objectForKeyOrEmptyString:(id)aKey {
    return [self objectForKeyOrDefault:aKey aDefault:@""];
}

- (id)objectForKeyOrNil:(id)aKey {
    return [self objectForKeyOrDefault:aKey aDefault:nil];
}

- (NSInteger)intForKeyOrDefault:(id)aKey aDefault:(NSInteger)aDefault {
    id object = [self objectForKeyOrDefault:aKey aDefault:nil];
    
    if (object) {
        if ([object respondsToSelector:@selector(intValue)]) {
            return [object intValue];
        }
    }
    
    return aDefault;
}

- (BOOL)boolForKeyOrDefault:(id)aKey aDefault:(BOOL)aDefault {
    id object = [self objectForKeyOrDefault:aKey aDefault:nil];
    
    if (object) {
        if ([object respondsToSelector:@selector(boolValue)]) {
            return [object boolValue];
        }
    }
    
    return aDefault;
}

- (id)objectForInt:(NSInteger)anInt {
    return [self objectForKey:[NSNumber numberWithInteger:anInt]];
}

@end
