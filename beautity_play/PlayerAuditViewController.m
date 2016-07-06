//
//  PlayerAuditViewController.m
//  beautity_play
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "PlayerAuditViewController.h"

@interface PlayerAuditViewController ()<pushAndDismissViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *time;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIImageView *addPhoto1;
@property (weak, nonatomic) IBOutlet UIImageView *addPhoto2;
@end

@implementation PlayerAuditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.titleLabel.text = @"达人认证";
    NSLog(@"%u",naview.titleLabel.text.length);
    [naview.finished setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:naview];
    // Do any additional setup after loading the view from its nib.
}

-(void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)finishClick:(UIButton *)sender
{
    NSLog(@"提交");
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
