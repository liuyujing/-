//
//  MR_FreeTime_View.h
//  泡啪
//
//  Created by Bruce on 15/10/1.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JTSlideShadowAnimation;

@interface MR_FreeTime_View : UIView
{
    CGFloat headerView_Width;
    CGFloat freeView_Width;
    UILabel *promptLabel;
}
@property (nonatomic, retain) UIImageView *headerView;
@property (nonatomic, retain) UIImageView *freeTimeView;
@property (nonatomic, retain) UILabel *contentLabel;

@property (strong, nonatomic) JTSlideShadowAnimation *shadowAnimation;

- (void)changeSize;

@end
