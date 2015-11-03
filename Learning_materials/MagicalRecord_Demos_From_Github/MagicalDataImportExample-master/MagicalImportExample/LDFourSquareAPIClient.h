//
//  LDFourSquareAPIClient.h
//  MagicalImportExample
//
//  Created by Denis Lebedev on 6/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFHTTPClient.h"

@interface LDFourSquareAPIClient : AFHTTPClient

+ (LDFourSquareAPIClient *)sharedClient;

@end
