//
//  loginViewController.m
//  beautity_play
//
//  Created by user_kevin on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "loginViewController.h"
#import "publicHeader.h"

@interface loginViewController ()<pushAndDismissViewDelegate>

@end

@implementation loginViewController


-(void)viewDidLoad
{
    [self creat_NavigationView];
    
}
-(void)creat_NavigationView
{
    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.titleLabel.text = @"登录";
    NSLog(@"%lu",naview.titleLabel.text.length);
    [self.view addSubview:naview];
    
    UIImageView * baseView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, width_screen, height_screen-60)];
    baseView.image = [UIImage imageNamed:@"register_bg"];
    baseView.alpha = 0.7;
    [self.view addSubview:baseView];
    
}
-(void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)finishClick:(UIButton *)sender
{
    NSLog(@"完成");
}
#pragma mark----状态栏
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
