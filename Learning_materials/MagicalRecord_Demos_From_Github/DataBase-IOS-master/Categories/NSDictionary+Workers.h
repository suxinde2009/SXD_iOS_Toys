//
//  NSDictionary+Workers.h
//  LifeScan
//
//  Created by Artur on 19/11/14.
//  Copyright (c) 2014 Racoons Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Workers)

- (id)objectForKeyOrDefault:(id)aKey aDefault:(id)aDefault;
- (id)objectForKeyOrEmptyString:(id)aKey;
- (id)objectForKeyOrNil:(id)aKey;

- (NSInteger)intForKeyOrDefault:(id)aKey aDefault:(NSInteger)aDefault;
- (BOOL)boolForKeyOrDefault:(id)aKey aDefault:(BOOL)aDefault;
- (id)objectForInt:(NSInteger)anInt;

@end
