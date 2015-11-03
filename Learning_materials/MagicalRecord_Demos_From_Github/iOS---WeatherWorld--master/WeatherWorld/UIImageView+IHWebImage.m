

#import "UIImageView+IHWebImage.h"
#import "ImageDownloader.h"
#import <objc/runtime.h>

static NSString * const key_Operation = @"com.myapp.operation.download.image";

@interface UIImageView (_IHWebImage)
@property (nonatomic, strong) NSOperation *downloadOperation;
@end


@implementation UIImageView (IHWebImage)

- (void)setDownloadOperation:(NSOperation *)operation
{
    objc_setAssociatedObject(self,
                             (__bridge const void *)(key_Operation),
                             operation,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSOperation *)downloadOperation
{
    return objc_getAssociatedObject(self, (__bridge const void *)(key_Operation));
}

- (void)ih_setImageFromURL:(NSURL *)imageURL completion:(void(^)(UIImage *))completionBlock
{
    ImageDownloader *downloader = [ImageDownloader sharedInstance];
    
    [downloader imageWithURL:imageURL completion:^(UIImage *image) {
        if (image) {
            self.image = image;
        }
        if (completionBlock) {
            completionBlock(image);
        }
        
    }];
    
}

@end
