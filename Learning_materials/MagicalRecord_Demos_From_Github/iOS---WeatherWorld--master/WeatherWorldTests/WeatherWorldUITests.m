#import <Kiwi.h>
#import <ObjectiveSugar.h>

#import "AppDelegate.h"

#define feature describe
#define scenario context

SPEC_BEGIN(UI_Tests)

feature(@"When my App first run", ^{
    __block AppDelegate *myApp;
    
    beforeEach(^{
        myApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    });
    
    it(@"should have a tab bar created", ^{
        [[myApp.window.rootViewController should] beMemberOfClass:[UITabBarController class]];
    });
    
    it(@"should contain two tabs inside the tab bar", ^{
        UITabBarController *tabBar = (UITabBarController *)myApp.window.rootViewController;
        [[@([[tabBar viewControllers] count]) should] equal:@2];
    });
    
});

SPEC_END