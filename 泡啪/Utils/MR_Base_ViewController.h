//
//  MR_Base_ViewController.h
//  泡啪
//
//  Created by Bruce on 15/9/23.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MR_Base_ViewController : UIViewController

@property (nonatomic, assign) BOOL hidenHUD;

- (void)showHUDTitle:(NSString *)title;

- (void)showHUDTitle:(NSString *)title andDelay:(NSTimeInterval)delayTime;

@end
