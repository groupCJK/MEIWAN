//
//  settingHeaderImageAndSex.m
//  beautity_play
//
//  Created by user_kevin on 16/7/10.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "settingHeaderImageAndSex.h"

@interface settingHeaderImageAndSex ()<pushAndDismissViewDelegate>

@end

@implementation settingHeaderImageAndSex

-(void)viewDidLoad
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, width_screen, height_screen-20)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [self creatNavigationView];
}
-(void)creatNavigationView
{
    pushAndDismissView * topView = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 40)];
    topView.titleLabel.text = @"完善资料";
    topView.delegate = self;
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
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
