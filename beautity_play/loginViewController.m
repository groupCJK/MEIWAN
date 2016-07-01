//
//  loginViewController.m
//  beautity_play
//
//  Created by user_kevin on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "loginViewController.h"
#import "publicHeader.h"
#import "ViewController.h"
@interface loginViewController ()<pushAndDismissViewDelegate>

@end

@implementation loginViewController


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
    
    //密码输入框
    UITextField * textfiledTwo = [[UITextField alloc]initWithFrame:CGRectMake(accountImage.frame.origin.x + accountImage.frame.size.width+5, imageView_textfiled.frame.origin.y + 44, imageView_textfiled.frame.size.width- (accountImage.frame.origin.x + accountImage.frame.size.width+5), imageView_textfiled.frame.size.height/2)];
    textfiledTwo.placeholder = @"密码";
    [self.view addSubview:textfiledTwo];
    
    //登录按钮
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.backgroundColor = RGB(125, 186, 201);
    loginButton.layer.cornerRadius = 5;
    loginButton.alpha = 0.55;
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.frame = CGRectMake(imageView_textfiled.frame.origin.x, imageView_textfiled.frame.origin.y+imageView_textfiled.frame.size.height+65, imageView_textfiled.frame.size.width, 44);
    [loginButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
}

-(void)finishClick:(UIButton *)sender
{
    NSLog(@"完成");
    [self.view endEditing:YES];
}

-(void)loginAction:(UIButton *)sender
{
    NSLog(@"登录");
    [self tabBarViewControllerCreat];
}
/**tableBar*/
- (void)tabBarViewControllerCreat
{
    //tababr文字颜色
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    MyTabbar * tabBarController = [[MyTabbar alloc]init];
    
    nearViewController * vc = [[nearViewController alloc]init];
    dynamicViewController * vc1 = [[dynamicViewController alloc]init];
    topViewController * vc2 = [[topViewController alloc]init];
    messageViewController * vc3 = [[messageViewController alloc]init];
    mineViewController * vc4 = [[mineViewController alloc]init];
    
    UINavigationController * mainPage = [[UINavigationController alloc]initWithRootViewController:vc];
    mainPage.navigationBar.backgroundColor = [UIColor blackColor];
    mainPage.tabBarItem.title = @"首页";
    UINavigationController * goodsPage = [[UINavigationController alloc]initWithRootViewController:vc1];
    goodsPage.tabBarItem.title = @"动态";
    
    UINavigationController * latestPage = [[UINavigationController alloc]initWithRootViewController:vc2];
    
    UINavigationController * shopCarPage = [[UINavigationController alloc]initWithRootViewController:vc3];
    shopCarPage.tabBarItem.title = @"消息";
    UINavigationController * myPage = [[UINavigationController alloc]initWithRootViewController:vc4];
    myPage.tabBarItem.title = @"个人";
    
    mainPage.tabBarItem.image = [[UIImage imageNamed:@"shouye"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainPage.tabBarItem.selectedImage = [[UIImage imageNamed:@"shouye2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    goodsPage.tabBarItem.image = [[UIImage imageNamed:@"dongtai2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    goodsPage.tabBarItem.selectedImage = [[UIImage imageNamed:@"dongtai"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    latestPage.tabBarItem.image = [[UIImage imageNamed:@"pai-hang-bang1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    latestPage.tabBarItem.selectedImage = [[UIImage imageNamed:@"pai-hang-bang8"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shopCarPage.tabBarItem.image = [[UIImage imageNamed:@"information"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shopCarPage.tabBarItem.selectedImage = [[UIImage imageNamed:@"information2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    myPage.tabBarItem.image = [[UIImage imageNamed:@"personal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myPage.tabBarItem.selectedImage = [[UIImage imageNamed:@"personal2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabbarController底部颜色
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 49)];
    backView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
    [tabBarController.tabBar insertSubview:backView atIndex:0];
    tabBarController.tabBar.opaque = YES;
    
    tabBarController.viewControllers = @[mainPage,goodsPage,latestPage,shopCarPage,myPage];
    
    [UIApplication sharedApplication].delegate.window.rootViewController = tabBarController;
    self.navigationController.navigationBarHidden = YES;
    //改变tabbarItem的默认位置
    UITabBar * tabbar = tabBarController.tabBar;
    UITabBarItem * tabbarItem3 = [tabbar.items objectAtIndex:2];
    tabbarItem3.imageInsets = UIEdgeInsetsMake(-3, 0, 3, 0);
    tabBarController.tabBar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-40 , [UIScreen mainScreen].bounds.size.width, 40);
}

#pragma mark----状态栏
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
