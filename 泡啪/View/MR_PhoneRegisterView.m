

//
//  MR_PhoneRegisterView.m
//  泡啪
//
//  Created by Bruce on 15/9/26.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_PhoneRegisterView.h"
#import "NSString+Phone.h"
#import "MBProgressHUD.h"

#import <SMS_SDK/SMS_SDK.h>

@implementation MR_PhoneRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        time = 60;
        step = VerPhoneNum;
        
        bgview = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
        bgview.frame = frame;
        [self addSubview:bgview];
        
        
        stepLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 30)];
        stepLabel.text = [NSString stringWithFormat:@"第%d步:",step];
        [bgview addSubview:stepLabel];
        
        
        [self stepFirst];
    }
    return self;
}

- (void)stepFirst
{
    phoneField = [[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(stepLabel.frame)+100, SCREEN_WIDTH-20-100, 40)];
    phoneField.borderStyle = UITextBorderStyleRoundedRect;
    phoneField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    phoneField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 40)];
    phoneField.leftViewMode = UITextFieldViewModeAlways;
    phoneField.placeholder = @"请输入手机号码";
    [bgview addSubview:phoneField];
    
    getVerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [getVerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    getVerButton.frame = CGRectMake(CGRectGetMaxX(phoneField.frame)+5, CGRectGetMinY(phoneField.frame), 100, 40);
    getVerButton.backgroundColor = [UIColor lightGrayColor];
    getVerButton.layer.cornerRadius = 5;
    getVerButton.showsTouchWhenHighlighted = YES;
    [getVerButton addTarget:self action:@selector(getVerCode:) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:getVerButton];
}

#pragma mark ------获得验证码---------
- (void)getVerCode:(UIButton *)sender
{
    switch (step) {
        case VerPhoneNum: {
            getVerButton.enabled = NO;
            
            [phoneField resignFirstResponder];
          
            
            if ([NSString isMobileNumber:phoneField.text]) {
                //        语音验证
             
//                 [SMS_SDK getVerificationCodeByVoiceCallWithPhone:phoneField.text zone:@"86" result:^(SMS_SDKError *error) {
//                 if (!error) {
//                 
//                 }else{
//                 [self showHUDWithTitle:error.errorDescription];
//                 }
//                 }];
             
            
                //        短信验证
                [SMS_SDK getVerificationCodeBySMSWithPhone:phoneField.text zone:@"86" result:^(SMS_SDKError *error) {
                    if (!error) {
                        userName = phoneField.text;
                        phoneField.text = @"";
                        phoneField.placeholder = @"请输入验证码";
                        [timer invalidate];
                        timer = nil;
                        
                        getVerButton.enabled = YES;
                        [getVerButton setTitle:@"注册" forState:UIControlStateNormal];
                        step = VerCode;
                        stepLabel.text = [NSString stringWithFormat:@"第%d步:",step];
                    }else{
                        [self recoverButton];
                        [self showHUDWithTitle:error.errorDescription];
                    }
                }];
             
            }else{
                [self showHUDWithTitle:@"请输入正确的手机号码"];
            }
             
            break;
        }
        case VerCode: {
            [SMS_SDK commitVerifyCode:phoneField.text result:^(enum SMS_ResponseState state) {
                if (state==0) {
                    [self showHUDWithTitle:@"验证码错误"];
                    phoneField.text = @"";
                    phoneField.placeholder = @"请输入手机号码";
                    [self recoverButton];
                }else{
                    [self gotoRegister];
                }
            }];
            break;
        }
        case Success: {
            
            break;
        }
        default: {
            break;
        }
    }
}

- (void)showHUDWithTitle:(NSString *)title
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:HUD];
    
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = title;
    HUD.margin = 10.f;
    [HUD show:YES];
    
    [HUD hide:YES afterDelay:2];
}

- (void)startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

#pragma mark --------开始倒计时------
- (void)countDown
{
    time--;
    [getVerButton setTitle:[NSString stringWithFormat:@"正在获取验证码%ld",time] forState:UIControlStateNormal];
    if (time==0) {
        [self recoverButton];
    }
}

#pragma mark -------重置按钮-------
- (void)recoverButton
{
    [timer invalidate];
    timer = nil;
    step = VerPhoneNum;
    getVerButton.enabled = YES;
    [getVerButton setTitle:@"获取验证码" forState:UIControlStateNormal];
}

#pragma mark --------注册---------
- (void)gotoRegister
{
    stepLabel.text = [NSString stringWithFormat:@"第%d步:",step];
    
    BmobUser *bUser = [[BmobUser alloc] init];
    [bUser setUsername:userName];
    [bUser setPassword:@"123456"];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"泡起按键" ofType:@"png"];
    
    BmobFile *bmobFile = [[BmobFile alloc]initWithFilePath:filePath];
    [bmobFile saveInBackground:^(BOOL isSuccessful, NSError *error) {
        
        NSLog(@"%@",error);
        
        if (isSuccessful) {
            [self showHUDWithTitle:@"注册成功!初始密码:123456"];
            [bUser setObject:bmobFile forKey:@"headerImage"];
            [bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
                if (isSuccessful){
                    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setBool:YES forKey:@"login"];
                    [defaults setObject:userName forKey:@"nameString"];
                    NSData *data = [NSData dataWithContentsOfFile:filePath];
                    [defaults setObject:data forKey:@"data"];
                    [defaults synchronize];
                    step = Success;
                    
                }
            }];
            
        }else{

            [self showHUDWithTitle:@"注册失败"];
        }
    } withProgressBlock:^(float progress) {
        
    }];
}
@end
