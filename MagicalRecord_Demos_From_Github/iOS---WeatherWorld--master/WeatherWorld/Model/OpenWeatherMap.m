//
//  OpenWeatherMap.m
//  WeatherWorld
//
//  Created by Diego Freniche Brito on 05/11/14.
//  Copyright (c) 2014 Pol Quintana. All rights reserved.
//

#import "OpenWeatherMap.h"

#define BASE_URL @"http://api.openweathermap.org/data/2.5/weather?lang=en&q="

@implementation OpenWeatherMap

- (NSDictionary *)weatherInfoForCity:(NSString *)cityName {
    
    NSString *stringURL = [NSString stringWithFormat:@"%@%@", BASE_URL, cityName];
    
    NSString *UTF8EncodedStringURL = [stringURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:UTF8EncodedStringURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    return result;
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSURLSession *urlSession = [NSURLSession sharedSession];
//
//    NSURLSessionDataTask *task = [urlSession dataTaskWithRequest:request];
//    
//    [task resume];
//
//    
//    while (task.state != NSURLSessionTaskStateCompleted) {
//        
//    }
//    
//    NSURLResponse *response = [task response];
//    
}


@end
