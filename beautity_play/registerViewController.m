//
//  registerViewController.m
//  beautity_play
//
//  Created by user_kevin on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "registerViewController.h"
#import "publicHeader.h"

@interface registerViewController()<pushAndDismissViewDelegate>

@end

@implementation registerViewController

-(void)viewDidLoad
{
    [self creat_NavigationView];
    
}
-(void)creat_NavigationView
{
    //自定义的导航条
    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.titleLabel.text = @"注册";
    NSLog(@"%lu",naview.titleLabel.text.length);
    [self.view addSubview:naview];
    
    //基础背景图
    UIImageView * baseView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, width_screen, height_screen-60)];
    baseView.image = [UIImage imageNamed:@"register_bg"];
    baseView.alpha = 0.7;
    [self.view addSubview:baseView];
    
    //输入框
    UITextField * textfield = [[UITextField alloc]initWithFrame:CGRectMake(20, 30, width_screen-40, 44)];
    textfield.backgroundColor = [UIColor blueColor];
    [self.view addSubview:textfield]; 
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
