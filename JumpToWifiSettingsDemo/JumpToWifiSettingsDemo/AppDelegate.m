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


///////////////////////////////////////////////////////////////////////
// 参考: http://cocoa.venj.me/blog/warn-no-network-and-show-settings/
///////////////////////////////////////////////////////////////////////


#import "AppDelegate.h"
#import "External/XDNetWorkStateMonitor/XDNetWorkStateMonitor.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // 监听网络连接状态
    //[self detectNetworkConnection];
    [self performSelector:@selector(detectNetworkConnection) withObject:nil afterDelay:1.0f];
    
    return YES;
}

- (void)detectNetworkConnection
{
    XDNetWorkStateMonitor *netWorkStateMonitor = [XDNetWorkStateMonitor sharedInstance];
    
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    //  NotReachable     = 0,
    //	ReachableViaWiFi = 2,
    //	ReachableViaWWAN = 1
    
    [netWorkStateMonitor initWithParent:self.window];
    [netWorkStateMonitor setPosition:CENTER_CENTER];
    [netWorkStateMonitor setCallback:^(int networkType) {
        
        NSLog(@"%s: %d", __func__, networkType);
        if (networkType == 0) { // 断网
            
            [nc postNotificationName:XDNetworkDisConnectedNotification object:nil];
            // OOXX......
            
        }else if (networkType == 1) { // 3G
            
            [nc postNotificationName:XDNetworkConnectedBy3GNotification object:nil];
            // OOXX......
            
            
        }else if (networkType == 2) { // Wifi
            
            [nc postNotificationName:XDNetworkConnectedByWifiNotification object:nil];
            // OOXX......
            
        }
        
    }];
    
    
    
    
}

@end
