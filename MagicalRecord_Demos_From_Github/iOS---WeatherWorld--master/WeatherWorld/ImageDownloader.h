
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^ImageDownloadCompletion)(UIImage *image);

@interface ImageDownloader : NSObject

+ (instancetype)sharedInstance;
//- (NSOperation *)imageOPERATIONWithURL:(NSURL *)imageURL
//                            completion:(ImageDownloadCompletion)completion;
- (void)imageWithURL:(NSURL *)imageURL
          completion:(ImageDownloadCompletion)completion;

@end
