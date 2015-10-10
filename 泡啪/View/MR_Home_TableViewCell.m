//
//  MR_Home_TableViewCell.m
//  泡啪
//
//  Created by Bruce on 15/10/1.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_Home_TableViewCell.h"

@implementation MR_Home_TableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.headerView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 54, 54)];
        self.headerView.layer.cornerRadius = 54/2;
        self.headerView.layer.masksToBounds = YES;
        self.headerView.layer.borderWidth = 2;
        self.headerView.layer.borderColor = [UIColor colorWithRed:0.4353 green:0.7216 blue:0.7569 alpha:1.0].CGColor;
//        self.headerView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.headerView];
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerView.frame)+10, 10, SCREEN_WIDTH-CGRectGetMaxX(self.headerView.frame)-20, 54/2)];
        [self.contentView addSubview:self.contentLabel];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.headerView.frame)+10, CGRectGetMaxY(self.contentLabel.frame), SCREEN_WIDTH-CGRectGetMaxX(self.headerView.frame)-20, 54/2)];
        self.nameLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.nameLabel];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
