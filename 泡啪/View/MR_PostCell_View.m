

//
//  MR_PostCell_View.m
//  泡啪
//
//  Created by Bruce on 15/10/2.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_PostCell_View.h"

@implementation MR_PostCell_View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, 30)];
        [self addSubview:self.titleLabel];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame), SCREEN_WIDTH, 100)];
        imageView.image = [UIImage imageNamed:@"编辑框"];
        [self addSubview:imageView];
        
    }
    return self;
}

@end
