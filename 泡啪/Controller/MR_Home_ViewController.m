//
//  MR_Home_ViewController.m
//  泡啪
//
//  Created by Bruce on 15/9/23.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_Home_ViewController.h"
#import "MR_PostActivity_ViewController.h"

#import "MR_Home_TableViewCell.h"
#import "MR_FreeTime_View.h"

#import "AppDelegate.h"

@interface MR_Home_ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *homeTableView;
}
@end

@implementation MR_Home_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addButtonToNavagationBar];
    
    [self createListView];
    [self freeTimeViews];
}

- (void)addButtonToNavagationBar
{
    UIBarButtonItem *item0 =[[UIBarButtonItem alloc]initWithTitle:@"      " style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"好友表示"] style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
    UIBarButtonItem *item1 =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"在进行消息"] style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
    UIBarButtonItem *item2 =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"筛选功能"] style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
    UIBarButtonItem *item3 =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"User_setting"] style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
    self.navigationItem.leftBarButtonItems = @[item0,item,item1,item2,item3];
}

- (void)action:(UIBarButtonItem *)sender
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app toggleLeftDrawer:self animated:YES];
}

- (void)createListView
{
    homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-120) style:UITableViewStylePlain];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:homeTableView];
}

#pragma mark ------表视图代理方法--------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"homeCell";
    MR_Home_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MR_Home_TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.headerView.image = [UIImage imageNamed:@"TTT.jpg"];
    cell.contentLabel.text = @"我想去喝酒~ 或者去打篮球";
    cell.nameLabel.text = @"习大大 24分钟前";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74;
}


#pragma mark ------是否有空界面--------
- (void)freeTimeViews
{
    MR_FreeTime_View *freeTimeView = [[MR_FreeTime_View alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-120, SCREEN_WIDTH, 120)];
    freeTimeView.headerView.image = [UIImage imageNamed:@"WWW.jpg"];
    [self.view addSubview:freeTimeView];
    
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(isFree:)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    [freeTimeView addGestureRecognizer:right];
}

#pragma mark ------滑动头像到我有空------
- (void)isFree:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        
        MR_FreeTime_View *bgView = (MR_FreeTime_View *)sender.view;
        UIImageView *headerView = bgView.headerView;
        CGPoint lastCenter = headerView.center;
        [UIView animateWithDuration:0.5 animations:^{
            headerView.center = bgView.freeTimeView.center;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                headerView.center = lastCenter;
            } completion:^(BOOL finished) {
                [bgView changeSize];
                
                MR_PostActivity_ViewController *postActivity = [[MR_PostActivity_ViewController alloc]init];
                [self.navigationController pushViewController:postActivity animated:YES];
            }];
            
        }];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
