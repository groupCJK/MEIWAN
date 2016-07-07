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
    NSLog(@"%lu",naview.titleLabel.text.length);
    [naview.finished setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:naview];
    
    [self loadSetTextDelegate];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)loadSetTextDelegate{
    self.time.textAlignment = NSTextAlignmentLeft;
    self.time.placeholder = @"(例如:看电影、玩游戏)";
    [self.time setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.time setValue:[UIFont boldSystemFontOfSize:11.0f] forKeyPath:@"_placeholderLabel.font"];
    self.time.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    NSMutableParagraphStyle *style = [self.time.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = self.time.font.lineHeight - (self.time.font.lineHeight - [UIFont systemFontOfSize:11.0f].lineHeight) / 2.0;
    //[UIFont systemFontOfSize:13.0f]是设置的placeholder的字体
    self.time.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.time.placeholder
                                                                      attributes:@{NSParagraphStyleAttributeName : style}];
    
    self.address.textAlignment = NSTextAlignmentLeft;
    self.address.placeholder = @"请填写详细地址";
    [self.address setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.address setValue:[UIFont boldSystemFontOfSize:11.0f] forKeyPath:@"_placeholderLabel.font"];
    self.address.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    NSMutableParagraphStyle *style2 = [self.address.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = self.address.font.lineHeight - (self.address.font.lineHeight - [UIFont systemFontOfSize:11.0f].lineHeight) / 2.0;
    //[UIFont systemFontOfSize:13.0f]是设置的placeholder的字体
    self.address.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.address.placeholder
                                                                         attributes:@{NSParagraphStyleAttributeName : style2}];
    
    self.phone.keyboardType = UIKeyboardTypeNamePhonePad;
    self.phone.textAlignment = NSTextAlignmentLeft;
    self.phone.placeholder = @"请输入正确的联系方式";
    [self.phone setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.phone setValue:[UIFont boldSystemFontOfSize:11.0f] forKeyPath:@"_placeholderLabel.font"];
    self.phone.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    NSMutableParagraphStyle *style3 = [self.phone.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = self.phone.font.lineHeight - (self.phone.font.lineHeight - [UIFont systemFontOfSize:11.0f].lineHeight) / 2.0;
    //[UIFont systemFontOfSize:13.0f]是设置的placeholder的字体
    self.phone.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.phone.placeholder
                                                                       attributes:@{NSParagraphStyleAttributeName : style3}];
}

-(void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)finishClick:(UIButton *)sender
{
    if (self.time.text.length != 0 && self.address.text.length != 0 && self.phone.text.length != 0) {
    }
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

