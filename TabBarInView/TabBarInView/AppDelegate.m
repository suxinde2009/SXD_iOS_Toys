/*
 The MIT License (MIT)
 
 Copyright (c) 2014 SuXinDe (Email: suxinde2009@126.com)
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SubViewController1.h"
#import "SubViewController2.h"
#import "SubViewController3.h"

#import "LeftViewController.h"
#import "RightViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createViews];
    
    
    return YES;
}

- (void)createViews
{
    [self initTabBarController];
    [self initTabBarItems:mMainViewController.tabBar];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mMainViewController];
    

    LeftViewController *lvc = [[LeftViewController alloc] init];
    RightViewController *rvc = [[RightViewController alloc] init];
    
    
    mDrawerViewController = [[MMDrawerController alloc] initWithCenterViewController:nav
                                                            leftDrawerViewController:lvc
                                                           rightDrawerViewController:rvc];
    [mDrawerViewController setMaximumLeftDrawerWidth:260.0];
    [mDrawerViewController setMaximumRightDrawerWidth:260.0];
    [mDrawerViewController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [mDrawerViewController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    
    [mDrawerViewController setGestureCompletionBlock:^(MMDrawerController *drawerController, UIGestureRecognizer *gesture) {
        NSLog(@"test");
        
      
    }];

    
    
    self.window.rootViewController = mDrawerViewController;
    
}

- (void)initTabBarController
{
    SubViewController1 *svc1 = [[SubViewController1 alloc] init];
    svc1.view.backgroundColor = [UIColor greenColor];
    
    SubViewController2 *svc2 = [[SubViewController2 alloc] init];
    svc2.view.backgroundColor = [UIColor redColor];
    
    SubViewController3 *svc3 = [[SubViewController3 alloc] init];
    svc3.view.backgroundColor = [UIColor blueColor];
    
    mMainViewController = [[MainViewController alloc] init];
    mMainViewController.view.backgroundColor = [UIColor yellowColor];
    [mMainViewController setViewControllers: @[svc1, svc2, svc3]];
    mMainViewController.delegate = self;
}

- (void)initTabBarItems:(UITabBar *)tabBar
{
    UITabBarItem *tabItem = tabBar.items[0];
    tabItem.title = @"VC1";
    
    tabItem = tabBar.items[1];
    tabItem.title = @"VC2";
    
    tabItem = tabBar.items[2];
    tabItem.title = @"VC3";
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"%s", __func__);
}

@end
