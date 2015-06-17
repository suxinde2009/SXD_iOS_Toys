//
//  NSDate+Convertion.m
//  DataBase-IOS
//
//  Created by Artur on 14/11/14.
//  Copyright (c) 2014 superarthur.io. All rights reserved.
//

#import "NSDate+Convertion.h"

@implementation NSDate (Convertion)

//dateString = @"2010-10-10 10:10:10 +0300";
+ (NSDate *)convertFullDateFromString:(NSString *)dateString
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    NSDate *dateResult = [dateFormatter dateFromString:dateString];
    
    NSLog(@"%@", [dateFormatter stringFromDate:dateResult]);
    
    return dateResult;
}

@end
