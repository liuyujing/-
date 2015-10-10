//
//  AppDelegate.h
//  泡啪
//
//  Created by Bruce on 15/9/23.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JVFloatingDrawerViewController;
@class MR_Home_ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    JVFloatingDrawerViewController *drawerViewController;
    UINavigationController *homeNV;
}
@property (strong, nonatomic) UIWindow *window;

- (void)toggleLeftDrawer:(id)sender animated:(BOOL)animated;
+ (AppDelegate *)globalDelegate;
- (UIViewController *)homeViewController;
- (JVFloatingDrawerViewController *)drawerViewController;
- (UIViewController *)orderViewController;
- (UIViewController *)otherViewController;

@end

