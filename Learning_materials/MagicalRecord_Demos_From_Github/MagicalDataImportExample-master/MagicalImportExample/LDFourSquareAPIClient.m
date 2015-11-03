//
//  LDFourSquareAPIClient.m
//  MagicalImportExample
//
//  Created by Denis Lebedev on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LDFourSquareAPIClient.h"
#import "AFJSONRequestOperation.h"

#pragma warning - does not work with "https://api.foursquare.com/v2/"
static NSString * const kBaseURL = @"https://api.foursquare.com/";


@implementation LDFourSquareAPIClient

+ (LDFourSquareAPIClient *)sharedClient {
    static LDFourSquareAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LDFourSquareAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    });
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}

@end
