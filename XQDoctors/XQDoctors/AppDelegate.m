//
//  AppDelegate.m
//  XQDoctors
//
//  Created by li on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "XQMainTableViewController.h"
#import "rwdSettingController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupApearence];
    
    //创建主窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //创建主界面的tableView
    XQMainTableViewController *mainVC = [[XQMainTableViewController alloc]init];
    
    //创建导航控制器
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    
    
    //创建侧面(左边)的tableView
    rwdSettingController *leftVC = [[rwdSettingController alloc]init];
    
    //设置给drawerVC
    MMDrawerController *drawerVC = [[MMDrawerController alloc] initWithCenterViewController:nav leftDrawerViewController:leftVC];
    
    //设置手势
    [drawerVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    //设置为主窗口的根控制器
    self.window.rootViewController = drawerVC;
    
    //设置程序主窗口并显示
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)setupApearence
{
    //设置背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"导航栏背景图"] forBarMetrics:UIBarMetricsDefault];
    
    //设置状态栏
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //设置tintColor
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    //设置title颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor],UITextAttributeFont:[UIFont systemFontOfSize:21]}];
    
}



@end
