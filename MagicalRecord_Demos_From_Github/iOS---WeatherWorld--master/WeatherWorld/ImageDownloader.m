
#import "ImageDownloader.h"
//#import "ImageDownloadOperation.h"

@interface ImageDownloader ()
@property (strong, nonatomic) dispatch_queue_t imageDownloaderQueue;
//@property (nonatomic, strong) NSOperationQueue *operationQueue;
@end

@implementation ImageDownloader

+ (instancetype)sharedInstance {
    
    static ImageDownloader *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ImageDownloader alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageDownloaderQueue = dispatch_queue_create("com.myapp.download.images", DISPATCH_QUEUE_SERIAL);
//        _operationQueue = [[NSOperationQueue alloc] init];
//        _operationQueue.maxConcurrentOperationCount = 1; // if max is 1, this would be a SERIAL queue.
    }
    return self;
}

/*
- (NSOperation *)imageOPERATIONWithURL:(NSURL *)imageURL
                            completion:(ImageDownloadCompletion)completion
{
    ImageDownloadOperation *op = nil;
    
    UIImage *image = [self cachedImageForURL:imageURL];
    
    if (!image) {
        
        /* 
           We would really need to do this using a real NSOperation.
           Inside the downloader there is only NSData dataWithURL
         //
        op = [[ImageDownloadOperation alloc] initWithImageURL:imageURL];
        
        __weak typeof(op) weakOp = op;
        [op setCompletionBlock:^{
            
            if (weakOp) {
                UIImage *image = [UIImage imageWithData:weakOp.imageData];
                completion(image);
                
                [self saveInCacheImageData:weakOp.imageData usingURLKey:imageURL];
            }
        }];
        
        [self.operationQueue addOperation:op]; // This will start the operation AS SOON AS there is room in the queue (there is a limit of concurrent operations, at least a system limit).
        
    } else {
        
        // Directly call completion passing the cached image
        completion(image);
    }
    
    return op;
}
*/

- (void)imageWithURL:(NSURL *)imageURL
          completion:(ImageDownloadCompletion)completion
{
    dispatch_queue_t backg_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backg_queue, ^{
        
        UIImage *image = [self cachedImageForURL:imageURL];
        
        if (!image) {
            NSData *imgData = [NSData dataWithContentsOfURL:imageURL];
            [self saveInCacheImageData:imgData usingURLKey:imageURL];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
        
    });

//    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//    UIImage *image = [UIImage imageWithData:imageData];
//    completion(image);

}

#pragma mark - Cache
- (void)saveInCacheImageData:(NSData *)imageData
                 usingURLKey:(NSURL *)imageURL
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // Use the url wihtout slashes, colons, ecc.
    NSString *imgURLKey = [self imageKeyForURL:imageURL];
    NSString *cacheFilePath = [[self cacheDirectory] stringByAppendingPathComponent:imgURLKey];
//    NSLog(@"💾 %@\n\n", cacheFilePath);
    BOOL isADirectory = NO;
    if(![fileManager fileExistsAtPath:cacheFilePath isDirectory:&isADirectory])
    {
        [imageData writeToFile:cacheFilePath atomically:YES]; // Thread save == atomically YES
        
        // Here we could also check if the file is a directory.
        //        if (isADirectory) {
        //            //
        //        }
    }

}

- (UIImage *)cachedImageForURL:(NSURL *)url
{
    UIImage *result = nil;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *imgURLKey = [self imageKeyForURL:url];
    NSString *cacheFilePath = [[self cacheDirectory] stringByAppendingPathComponent:imgURLKey];
    
    if ([fileManager fileExistsAtPath:cacheFilePath]) {
        NSData *imgData = [NSData dataWithContentsOfFile:cacheFilePath];
        result = [UIImage imageWithData:imgData];
    }
    
    return result;
}

- (NSString *)imageKeyForURL:(NSURL *)url
{
    return [[[[[url description]
             stringByReplacingOccurrencesOfString:@"/" withString:@""]
            stringByReplacingOccurrencesOfString:@"\\" withString:@""]
            stringByReplacingOccurrencesOfString:@":" withString:@""]
            stringByReplacingOccurrencesOfString:@"http" withString:@""];
}

- (NSString *)cacheDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}


@end
