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
    UIImageView * imageView_textfiled = [[UIImageView alloc]initWithFrame:CGRectMake(20,baseView.frame.origin.y + 30, width_screen-40, 88)];
    imageView_textfiled.image = [UIImage imageNamed:@"yuanjiao-ju-xing"];
    [self.view addSubview:imageView_textfiled];
    //用户图标
    UIImageView * accountImage = [[UIImageView alloc]initWithFrame:CGRectMake(imageView_textfiled.frame.origin.x+15, imageView_textfiled.frame.origin.y+15, 15, 15)];
    accountImage.image = [UIImage imageNamed:@"Profile"];
    [self.view addSubview:accountImage];
    //用户输入框
    UITextField * textfiledOne =[[UITextField alloc]initWithFrame:CGRectMake(accountImage.frame.origin.x + accountImage.frame.size.width+5, imageView_textfiled.frame.origin.y, imageView_textfiled.frame.size.width- (accountImage.frame.origin.x + accountImage.frame.size.width+5), imageView_textfiled.frame.size.height/2)];
    textfiledOne.placeholder = @"手机号";
    [self.view addSubview:textfiledOne];
    //密码图标
    UIImageView * passwordImage = [[UIImageView alloc]initWithFrame:CGRectMake(accountImage.frame.origin.x, imageView_textfiled.frame.origin.y+ imageView_textfiled.frame.size.height/2+15, 15, 15)];
    passwordImage.image = [UIImage imageNamed:@"lock"];
    [self.view addSubview:passwordImage];
    //
    UITextField * textfiledTwo = [[UITextField alloc]initWithFrame:CGRectMake(accountImage.frame.origin.x + accountImage.frame.size.width+5, imageView_textfiled.frame.origin.y + 44, imageView_textfiled.frame.size.width- (accountImage.frame.origin.x + accountImage.frame.size.width+5), imageView_textfiled.frame.size.height/2)];
    textfiledTwo.placeholder = @"密码";
    [self.view addSubview:textfiledTwo];
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
