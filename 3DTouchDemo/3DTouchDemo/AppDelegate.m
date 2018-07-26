//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by 尾灯 on 2018/7/25.
//  Copyright © 2018年 尾灯. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
     静态添加，可将此段代码拷贝过去info.plist即可
     <key>UIApplicationShortcutItems</key>
     <array>
     <dict>
     <key>UIApplicationShortcutItemTitle</key>
     <string>开始直播</string>
     <key>UIApplicationShortcutItemType</key>
     <string>com.startLive</string>
     <key>UIApplicationShortcutItemIconFile</key>
     <string>3d_touch_live</string>
     </dict>
     <dict>
     <key>UIApplicationShortcutItemTitle</key>
     <string>私信</string>
     <key>UIApplicationShortcutItemType</key>
     <string>com.message</string>
     <key>UIApplicationShortcutItemIconFile</key>
     <string>3d_touch_message</string>
     </dict>
     <dict>
     <key>UIApplicationShortcutItemTitle</key>
     <string>关注的人</string>
     <key>UIApplicationShortcutItemType</key>
     <string>com.follow</string>
     <key>UIApplicationShortcutItemIconFile</key>
     <string>3d_touch_follow</string>
     </dict>
     </array>
     */

    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    //判断是否支持3DTouch
    if (self.window.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self createShortcutItem];
    }
    return YES;
}

//动态创建3DTouch shortcutItem。静态创建在info.plist文件中创建
- (void)createShortcutItem
{
    //开始直播
    UIApplicationShortcutIcon *liveIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"3d_touch_live"];
    UIApplicationShortcutItem *liveItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.startLive" localizedTitle:@"开始直播" localizedSubtitle:nil icon:liveIcon userInfo:nil];
    //私信
    UIApplicationShortcutIcon *messageIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"3d_touch_message"];
    UIApplicationShortcutItem *messageItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.message" localizedTitle:@"私信" localizedSubtitle:nil icon:messageIcon userInfo:nil];
    //关注的人
    UIApplicationShortcutIcon *followIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"3d_touch_live"];
    UIApplicationShortcutItem *followItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.follow" localizedTitle:@"关注的人" localizedSubtitle:nil icon:followIcon userInfo:nil];
    [[UIApplication sharedApplication] setShortcutItems:@[liveItem,messageItem,followItem]];
}

//监听3DTouch主屏幕交互按钮的点击事件
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法，可以在这个方法做相应的处理
    [self alertView:shortcutItem];
}

- (void)alertView:(UIApplicationShortcutItem *)shortcutItem
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:shortcutItem.localizedTitle message:shortcutItem.type delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
