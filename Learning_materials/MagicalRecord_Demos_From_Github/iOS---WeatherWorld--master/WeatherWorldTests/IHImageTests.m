#import <Kiwi.h>
#import <ObjectiveSugar.h>

#import "UIImageView+IHWebImage.h"

#define URL @"http://www.latostadora.com/generados/tiendas/6338/dibujos/157089.jpg"
#define IVEEVATENTHEWHOLEWORLD @"http://lavozdelzulia.com/wp-content/uploads/2014/09/Kim-Jong-un-lvz.jpg"

SPEC_BEGIN(TestingTheDaniThing)

describe(@"Using the IHWebImage", ^{
    
    CGRect rect = CGRectMake(0, 0, 100, 100);
    __block UIImageView *image;
    
    beforeEach(^{
        image = [[UIImageView alloc] initWithFrame:rect];
    });
    
    it(@"should install properly the Category", ^{
        [[image should] respondToSelector:@selector(ih_setImageFromURL:completion:)];
    });
    
    it(@"should set the chiquito image from the Interwebs", ^{
        NSURL *url = [NSURL URLWithString:URL];
        [image ih_setImageFromURL:url completion:nil];
        
        [[expectFutureValue(image.image) shouldEventually] beNonNil];
    });
   
    it(@"should set the image to nil with a non valid URL", ^{
        NSURL *url = [NSURL URLWithString:nil];
        [image ih_setImageFromURL:url completion:nil];

        [[expectFutureValue(image.image) shouldEventually] beNil];
    });
    
    it(@"should set a result of type UIImage",^{
        NSURL *url = [NSURL URLWithString:URL];
        [image ih_setImageFromURL:url completion:nil];
        
        [[expectFutureValue(image.image) shouldEventually] beMemberOfClass:[UIImage class]];

    });
    
    it(@"should run the passed block", ^{
        __block BOOL runTheBlock = NO;
        
        NSURL *url = [NSURL URLWithString:URL];
        [image ih_setImageFromURL:url completion:^(UIImage *img) {
            runTheBlock = YES;
        }];
        
        [[expectFutureValue(@(runTheBlock)) shouldEventually] beYes];
    });
});




SPEC_END