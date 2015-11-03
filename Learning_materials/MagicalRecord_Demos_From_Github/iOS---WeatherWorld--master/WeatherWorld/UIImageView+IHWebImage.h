

#import <UIKit/UIKit.h>

@interface UIImageView (IHWebImage)
- (void)ih_setImageFromURL:(NSURL *)imageURL completion:(void(^)(UIImage *))completionBlock;
@end
