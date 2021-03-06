//
//  ViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "ViewController.h"

#import "publicHeader.h"
#import "headerName.pch"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        [self creat_scrollView];
}
-(void)creat_scrollView
{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL firstUse = [userDefaults boolForKey:@"firstUse"];
    NSString * usename = [userDefaults stringForKey:@"username"];
    [userDefaults synchronize];
    //判断是否第一次使用软件是展示引导图不是展示登陆页
    if (firstUse == YES) {
        
        if (usename != nil) {
            //如果本地查到用户账号则自动登录（发送请求）展示tabbar界面
            
            
            [self tabBarViewControllerCreat];
        }else{
            //如果没查到则进入登陆注册界面
            UIImageView * backGroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showImage4"]];
            backGroundImage.frame = CGRectMake(0, 0, width_screen, height_screen);
            [self.view addSubview:backGroundImage];
            
            /**注册按钮*/
            UIButton * registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
            registerButton.frame = CGRectMake(20 , height_screen-110, 120, 44);
            [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:registerButton];
            /**登陆按钮*/
            UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
            loginButton.frame = CGRectMake(registerButton.frame.size.width+registerButton.frame.origin.x + 40, registerButton.frame.origin.y, registerButton.frame.size.width, registerButton.frame.size.height) ;
            [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:loginButton];
        }
        
    }else{
        UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen)];
        scrollView.contentSize = CGSizeMake(width_screen*4, 0);
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:scrollView];
        
        for (int i = 0; i<4 ; i++) {
            UIImageView * showImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width_screen * i, 0, width_screen, height_screen)];
            showImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"showImage%d",i+1]];
            [scrollView addSubview:showImageView];
        }
        /**注册按钮*/
        UIButton * registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        registerButton.frame = CGRectMake(20 + width_screen*3, height_screen-110, 120, 44);
        [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:registerButton];
        /**登陆按钮*/
        UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        loginButton.frame = CGRectMake(registerButton.frame.size.width+registerButton.frame.origin.x + 40, registerButton.frame.origin.y, registerButton.frame.size.width, registerButton.frame.size.height) ;
        [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:loginButton];

    }

    
   }
/**注册*/
- (void)registerButtonClick
{
    [self firstUse];
    registerViewController * registerVC = [[registerViewController alloc]init];
    registerVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:registerVC animated:YES completion:nil];
}
/**登陆*/
- (void)loginButtonClick
{
    [self firstUse];
    loginViewController * loginVC = [[loginViewController alloc]init];
    loginVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:loginVC animated:YES completion:nil];
}
/**写进本地*/
- (void)firstUse
{
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setBool:YES forKey:@"firstUse"];
    [userdefaults synchronize];
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
    
//    self.navigationController.na
    
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



@end
