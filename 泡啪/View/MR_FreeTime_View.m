//
//  MR_FreeTime_View.m
//  泡啪
//
//  Created by Bruce on 15/10/1.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_FreeTime_View.h"
#import "JTSlideShadowAnimation.h"

@implementation MR_FreeTime_View


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        headerView_Width = 80;
        freeView_Width = 100;
        
        self.headerView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, headerView_Width, headerView_Width)];
        self.headerView.layer.cornerRadius = headerView_Width/2;
        self.headerView.layer.masksToBounds = YES;
//        self.headerView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.headerView];
        
        self.freeTimeView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-20-100, 10, freeView_Width, freeView_Width)];
        self.freeTimeView.contentMode = UIViewContentModeScaleAspectFit;
        self.freeTimeView.layer.borderColor = [UIColor colorWithRed:0.4353 green:0.7216 blue:0.7569 alpha:1.0].CGColor;
        self.freeTimeView.layer.borderWidth = 6;
        self.freeTimeView.layer.cornerRadius = freeView_Width/2;
        self.freeTimeView.layer.masksToBounds = YES;
        
        [self addSubview:self.freeTimeView];
        
        
        promptLabel = [[UILabel alloc]initWithFrame:self.freeTimeView.bounds];
        promptLabel.textColor = [UIColor lightGrayColor];
        promptLabel.text = @"有空";
        promptLabel.textAlignment = NSTextAlignmentCenter;
        promptLabel.font = [UIFont systemFontOfSize:25];
        [self.freeTimeView addSubview:promptLabel];
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerView.frame)+10, 10, SCREEN_WIDTH-20-200, 100)];
        self.contentLabel.textColor = [UIColor grayColor];
        self.contentLabel.text = @"滑动到绿色圈\n告诉世界我有空";
        self.contentLabel.numberOfLines = 2;
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.contentLabel];
        
        
        self.shadowAnimation = [JTSlideShadowAnimation new];
        self.shadowAnimation.animatedView = self.contentLabel;
        self.shadowAnimation.shadowWidth = 40.;
        [self.shadowAnimation start];
    }
    return self;
}

- (void)changeSize
{
    headerView_Width = headerView_Width==100 ? 80:100;
    freeView_Width = freeView_Width==80 ? 100:80;
    
    self.headerView.frame = CGRectMake(10, 10, headerView_Width, headerView_Width);
    self.headerView.layer.borderColor = [UIColor colorWithRed:0.4353 green:0.7216 blue:0.7569 alpha:1.0].CGColor;
    self.headerView.layer.borderWidth = headerView_Width==100 ? 6:0;
    self.headerView.layer.cornerRadius = headerView_Width/2;
    self.headerView.layer.masksToBounds = YES;
    
    self.freeTimeView.frame = CGRectMake(SCREEN_WIDTH-20-100, 10, freeView_Width, freeView_Width);
    self.freeTimeView.layer.borderColor = freeView_Width==100 ? [UIColor colorWithRed:0.4353 green:0.7216 blue:0.7569 alpha:1.0].CGColor:[UIColor orangeColor].CGColor;
    self.freeTimeView.layer.borderWidth = 6;
    self.freeTimeView.layer.cornerRadius = freeView_Width/2;
    self.freeTimeView.layer.masksToBounds = YES;
    
    promptLabel.frame = self.freeTimeView.bounds;
    promptLabel.text = freeView_Width==100 ?@"有空":@"没空了";
    promptLabel.font = [UIFont systemFontOfSize:freeView_Width==100 ?25:15];
    
    freeView_Width==100 ? [self.shadowAnimation start]:[self.shadowAnimation stop];

    self.contentLabel.text = freeView_Width==100 ? @"滑动到绿色圈\n告诉世界我有空":@"我想去喝酒~\n或者去打篮球";
    
    self.headerView.center = CGPointMake(self.headerView.center.x, 120/2);
    self.freeTimeView.center = CGPointMake(self.freeTimeView.center.x, 120/2);
}


@end
