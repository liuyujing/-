//
//  MR_PhoneRegisterView.h
//  泡啪
//
//  Created by Bruce on 15/9/26.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum VerStep{
    VerPhoneNum = 1,
    VerCode,
    Success,
}VerStep;

@interface MR_PhoneRegisterView : UIView
{
    UIVisualEffectView *bgview;
    UILabel *stepLabel;
    UITextField *phoneField;
    UIButton *getVerButton;
    
    VerStep step;//验证步骤
    NSTimer *timer;
    NSInteger time;
    NSString *userName;
}
@end
