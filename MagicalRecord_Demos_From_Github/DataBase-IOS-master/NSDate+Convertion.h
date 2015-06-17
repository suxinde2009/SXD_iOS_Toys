//
//  NSDate+Convertion.h
//  DataBase-IOS
//
//  Created by Artur on 14/11/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Convertion)

//2014-10-31 12:34:56 +0300
+ (NSDate *)convertFullDateFromString:(NSString *)str;

@end
