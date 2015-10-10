//
//  NSString+Phone.m
//  泡啪
//
//  Created by Bruce on 15/9/26.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "NSString+Phone.h"
#import "RegexKitLite.h"

@implementation NSString (Phone)

//手机号码验证
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    NSString * phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    BOOL isMatch = [mobileNum isMatchedByRegex:phoneRegex];
    return isMatch;
}

@end
