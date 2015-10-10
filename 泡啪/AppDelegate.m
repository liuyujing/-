//
//  AppDelegate.m
//  泡啪
//
//  Created by Bruce on 15/9/23.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "AppDelegate.h"
#import "MR_Home_ViewController.h"
#import "MR_Setting_ViewController.h"
#import "JVFloatingDrawerViewController.h"
#import "JVFloatingDrawerSpringAnimator.h"

#import <SMS_SDK/SMS_SDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    短信验证码
    [SMS_SDK registerApp:APP_Key withSecret:APP_Secret];
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    drawerViewController = [[JVFloatingDrawerViewController alloc]init];
    MR_Home_ViewController *homeVC =[[MR_Home_ViewController alloc]init];
    homeNV = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    drawerViewController.centerViewController = homeNV;
    
    MR_Setting_ViewController *rightVC = [[MR_Setting_ViewController alloc]init];
    drawerViewController.rightViewController = rightVC;
    
    drawerViewController.backgroundImage = [UIImage imageNamed:@"Default"];
    
    //    添加动画效果
    JVFloatingDrawerSpringAnimator *drawerAnimator = [[JVFloatingDrawerSpringAnimator alloc] init];
    drawerViewController.animator = drawerAnimator;
    
    
    self.window.rootViewController = drawerViewController;
    
//    设置导航栏透明
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"10句话按键"] forBarMetrics:UIBarMetricsCompact];
//    设置导航栏的按钮颜色为黑色
    [UINavigationBar appearance].tintColor = [UIColor blackColor];
//    设置状态栏颜色为白色
     [application setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    [self.window makeKeyAndVisible];

    return YES;
}


//点击中心视图的左侧按钮触发
- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated {
    [drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideRight animated:animated completion:nil];
}

+ (AppDelegate *)globalDelegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (JVFloatingDrawerViewController *)drawerViewController {
    if (!drawerViewController) {
        drawerViewController = [[JVFloatingDrawerViewController alloc] init];
    }
    
    return drawerViewController;
}

- (UIViewController *)homeViewController
{
    return homeNV;
}

- (UIViewController *)orderViewController
{
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:[[MR_Setting_ViewController alloc]init]];
    return nv;
}

- (UIViewController *)otherViewController
{
    UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:[[MR_Setting_ViewController alloc]init]];
    return nv;
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

@end
