//
//  getNumberViewController.m
//  beautity_play
//
//  Created by user_kevin on 16/7/1.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "getNumberViewController.h"
#import "settingHeaderImageAndSex.h"

@interface getNumberViewController ()<pushAndDismissViewDelegate>
{
    MZTimerLabel * timelabel;
}
@end

@implementation getNumberViewController
-(void)viewWillAppear:(BOOL)animated
{
//    self.navigationController.navigationBar.hidden= YES;
}
-(void)viewDidLoad
{
    [self creatNavigationView];
}
-(void)creatNavigationView
{
//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, width_screen, height_screen-20)];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    
    UIImageView * baseView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 60, width_screen, height_screen-60)];
    baseView.image = [UIImage imageNamed:@"register_bg"];
    baseView.alpha = 0.7;
    [self.view addSubview:baseView];
    
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary * dic = [[NSDictionary alloc]initWithDictionary: [userdefaults objectForKey:@"registerAccount"]];
    NSLog(@"%@",dic);
    [userdefaults synchronize];
    pushAndDismissView * topView = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 40)];
    topView.delegate = self;
    topView.titleLabel.text = @"获得验证码";
    topView.finished.hidden = YES;
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"收不到验证码" forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    button.titleLabel.font = Font(12.0);
    [button setTitleColor:RGB(126, 206, 144) forState:UIControlStateNormal];
    button.frame = CGRectMake( width_screen-90, 0, 90, 40);
    [button addTarget:self action:@selector(cannotGetNumber) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview: button];
    [self.view addSubview:topView];
    
    UILabel * phone = [[UILabel alloc]init];
    phone.text = [NSString stringWithFormat:@"+86 %@",dic[@"phone"]];
    phone.font = Font(14.0);
    phone.textAlignment = NSTextAlignmentCenter;
    CGSize sizeForphone = [phone.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:phone.font,NSFontAttributeName, nil]];
    phone.frame = CGRectMake((width_screen-sizeForphone.width)/2, topView.frame.origin.y+topView.frame.size.height+35, sizeForphone.width, sizeForphone.height);
    phone.textColor = [CorlorTransform colorWithHexString:@"#646464"];
    [self.view addSubview:phone];
    
    UIImageView * iconImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Profile"]];
    iconImage.frame = CGRectMake(phone.frame.origin.x-20, phone.frame.origin.y, 15, 15);
    [self.view addSubview:iconImage];
    
    UIView * textFileImage = [[UIView alloc]init];
    textFileImage.frame = CGRectMake(20, phone.frame.origin.y+phone.frame.size.height+20, width_screen-40, 40);
    textFileImage.backgroundColor = [CorlorTransform colorWithHexString:@"7dbac9"];
    textFileImage.alpha = 0.7;
    textFileImage.layer.cornerRadius = 5;
    [self.view addSubview:textFileImage];
    
    UITextField * textfield = [[UITextField alloc]initWithFrame:CGRectMake(textFileImage.frame.origin.x+20, textFileImage.frame.origin.y, textFileImage.frame.size.width-20-80, textFileImage.frame.size.height)];
    textfield.textColor = [CorlorTransform colorWithHexString:@"#646464"];
    [self.view addSubview:textfield];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(textfield.frame.size.width+20, 0, 80, textFileImage.frame.size.height)];
    label.backgroundColor = [CorlorTransform colorWithHexString:@"#646464"];
    label.layer.cornerRadius = 5;
    label.clipsToBounds = YES;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [textFileImage addSubview:label];
    
    UIButton * reGetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    reGetButton.frame = label.frame;
    [reGetButton addTarget:self action:@selector(reget) forControlEvents:UIControlEventTouchUpInside];
    reGetButton.userInteractionEnabled = NO;
    [textFileImage addSubview:reGetButton];
    
    timelabel = [[MZTimerLabel alloc]initWithLabel:label andTimerType:MZTimerLabelTypeTimer];
    [timelabel setCountDownTime:60];
    timelabel.timeFormat = @"ss";
    [timelabel startWithEndingBlock:^(NSTimeInterval countTime) {
        
        label.text = @"重新获取";
        reGetButton.userInteractionEnabled = YES;
        
    }];
    
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    loginButton.backgroundColor = RGB(125, 186, 201);
    loginButton.layer.cornerRadius = 5;
    loginButton.alpha = 0.55;
    [loginButton setTitle:@"下一步" forState:UIControlStateNormal];
    loginButton.frame = CGRectMake(textFileImage.frame.origin.x, textFileImage.frame.origin.y+textFileImage.frame.size.height+40, textFileImage.frame.size.width, 40);
    [loginButton addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}
-(void)reget
{
    NSLog(@"重新获取");
    [timelabel setCountDownTime:60];
    [timelabel start];
}
-(void)cannotGetNumber
{
    NSLog(@"获取不到验证码");
    
}
- (void)registerAction:(UIButton *)sender
{
    NSLog(@"下一步");
    settingHeaderImageAndSex * setting = [[settingHeaderImageAndSex alloc]init];
    [self presentViewController:setting animated:YES completion:nil];
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
