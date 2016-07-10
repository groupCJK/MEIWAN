//
//  WalletBalanceViewController.m
//  beautity_play
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "WalletBalanceViewController.h"

@interface WalletBalanceViewController ()<pushAndDismissViewDelegate>
{
    UIView *blackView;
    UIImageView *moneyImage;
    UILabel *moneyLabel;
    UIButton *withdrawalbutton;
}

@end

@implementation WalletBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, width_screen, height_screen-64)];
    blackView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:blackView];
    
    moneyImage = [[UIImageView alloc] initWithFrame:CGRectMake((width_screen-98)/2, 28, 98, 98)];
    moneyImage.backgroundColor = [UIColor blackColor];
    [blackView addSubview:moneyImage];
    
    moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, moneyImage.frame.origin.y+moneyImage.frame.size.height+36, width_screen, 60)];
    moneyLabel.text = @"1000.0";
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    moneyLabel.font = [UIFont systemFontOfSize:54.0f];
    [blackView addSubview:moneyLabel];
    
    withdrawalbutton = [[UIButton alloc] initWithFrame:CGRectMake(34, moneyLabel.frame.origin.y+moneyLabel.frame.size.height+50, self.view.frame.size.width-68, 34)];
    [withdrawalbutton setTitleColor:NavColor forState:UIControlStateNormal];
    [withdrawalbutton setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [withdrawalbutton setTitle:@"提现" forState:UIControlStateNormal];
    withdrawalbutton.backgroundColor = [UIColor whiteColor];
    withdrawalbutton.layer.cornerRadius = 7.0;
    withdrawalbutton.layer.masksToBounds = YES;
    [blackView addSubview:withdrawalbutton];
    
    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.finished.hidden = YES;
    naview.titleLabel.text = @"我的余额";
    NSLog(@"%lu",naview.titleLabel.text.length);
    [self.view addSubview:naview];
    
    // Do any additional setup after loading the view.
}

-(void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)finishClick:(UIButton *)sender
{
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
