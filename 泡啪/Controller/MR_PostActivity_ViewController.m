//
//  MR_PostActivity_ViewController.m
//  泡啪
//
//  Created by Bruce on 15/10/1.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_PostActivity_ViewController.h"
#import "MR_SelectFriend_ViewController.h"

#import "MR_PostCell_View.h"

@interface MR_PostActivity_ViewController ()

@end

@implementation MR_PostActivity_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavagationItem];
    
    [self createViews];
}

- (void)addNavagationItem
{
    UIBarButtonItem *left =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
    left.tag = 11;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(300, 0, 44, 44);
    [button setBackgroundImage:[UIImage imageNamed:@"done"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right =[[UIBarButtonItem alloc]initWithCustomView:button];
    right.tag = 12;
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.rightBarButtonItem = right;
    
}

- (void)createViews
{
    for (int i=0; i<3; i++) {
        MR_PostCell_View *postCell = [[MR_PostCell_View alloc]initWithFrame:CGRectMake(0, 100+(130+20)*i, SCREEN_WIDTH, 130)];
        postCell.tag = 100+i;
        postCell.titleLabel.text = @"这感情好";
        [self.view addSubview:postCell];
    }
    
    MR_PostCell_View *selectPersonView = (MR_PostCell_View *)[self.view viewWithTag:101];
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10+(50+5)*i, 5, 50, 50);
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(selectFriend:) forControlEvents:UIControlEventTouchUpInside];
        [selectPersonView addSubview:button];
    }
}

- (void)selectFriend:(UIButton *)sender
{
    MR_SelectFriend_ViewController *friendViewController = [[MR_SelectFriend_ViewController alloc]init];
    [self.navigationController pushViewController:friendViewController animated:YES];
}


- (void)action:(UIBarButtonItem *)sender
{
    sender.tag != 11 ? [self finish]:[self back];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)finish
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
