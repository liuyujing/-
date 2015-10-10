//
//  MR_Base_ViewController.m
//  泡啪
//
//  Created by Bruce on 15/9/23.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_Base_ViewController.h"
#import "MBProgressHUD.h"

@interface MR_Base_ViewController ()
{
    MBProgressHUD *HUD;
}
@end

@implementation MR_Base_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)showHUDTitle:(NSString *)title andDelay:(NSTimeInterval)delayTime
{
    if (HUD) {
        [HUD removeFromSuperview];
        HUD = nil;
    }
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = title;
    HUD.margin = 10.f;
    [HUD show:YES];
    
    [HUD hide:YES afterDelay:delayTime];
    
}


- (void)showHUDTitle:(NSString *)title
{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.labelText = title;
    [HUD show:YES];
}

- (void)setHidenHUD:(BOOL)hidenHUD
{
    [HUD hide:hidenHUD];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
