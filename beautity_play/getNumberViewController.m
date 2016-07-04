//
//  getNumberViewController.m
//  beautity_play
//
//  Created by user_kevin on 16/7/1.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "getNumberViewController.h"

@interface getNumberViewController ()<pushAndDismissViewDelegate>

@end

@implementation getNumberViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.hidesBarsOnTap = YES;
}
-(void)viewDidLoad
{
    [self creatNavigationView];
}
-(void)creatNavigationView
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, width_screen, height_screen-20)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * dic = [[NSDictionary alloc]initWithDictionary: [userdefaults objectForKey:@"registerAccount"]];
    NSLog(@"%@",dic);
    [userdefaults synchronize];
    pushAndDismissView * topView = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 40)];
    topView.delegate = self;
    topView.titleLabel.text = @"获得验证码";
    topView.finished.hidden = YES;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"获取不到验证码" forState:UIControlStateNormal];
    button.titleLabel.font = Font(12.0);
    [button setTitleColor:RGB(50, 100, 50) forState:UIControlStateNormal];
     
    [self.view addSubview:topView];
}
-(void)finishClick:(UIButton *)sender
{
    NSLog(@"完成");
}
-(void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark----状态栏
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
