//
//  MR_Register_ViewController.m
//  泡啪
//
//  Created by Bruce on 15/9/26.
//  Copyright (c) 2015年 Bruce. All rights reserved.
//

#import "MR_Register_ViewController.h"
#import "MR_PhoneRegisterView.h"

@interface MR_Register_ViewController ()

@end

@implementation MR_Register_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createViews];
}

- (void)createViews
{
    
    UIImageView *pointerView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 40,(SCREEN_WIDTH-20)/3,(SCREEN_HEIGHT-40+20)/4)];
    pointerView.image = [UIImage imageNamed:@"戳它们切图"];
    pointerView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:pointerView];
    
    
    CGFloat Width_Button = SCREEN_WIDTH/2.5;
    CGFloat Y_Button = CGRectGetMaxY(pointerView.frame)+10;
    NSArray *images_Button = @[@"微信注册切图",@"电话注册切图"];
    for (int i = 0; i<2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((SCREEN_WIDTH-Width_Button)/2, Y_Button+(Width_Button+30)*i, Width_Button, Width_Button);
        [button setBackgroundImage:[UIImage imageNamed:images_Button[i]] forState:UIControlStateNormal];
        button.tag = 100+i;
        [button addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
   
    UIButton *button = (UIButton *)[self.view viewWithTag:100];
    UIImage *image = [UIImage imageNamed:@"or"];
    CGFloat orX = (SCREEN_WIDTH-(image.size.width/3))/2;
    UIImageView *orView = [[UIImageView alloc]initWithFrame:CGRectMake(orX, CGRectGetMaxY(button.frame),image.size.width/3,image.size.height/3)];
    orView.image = image;
    [self.view addSubview:orView];
    
}

- (void)action:(UIButton *)sender
{
    switch (sender.tag) {
        case 100:
        {
            
        }
            break;
        case 101:
        {
            MR_PhoneRegisterView *phoneView = [[MR_PhoneRegisterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            phoneView.center = self.view.center;
            [self.view addSubview:phoneView];
        }
            break;
        default:
            break;
    }
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
