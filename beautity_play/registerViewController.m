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
{
    UITextField * textfiledOne;
    UITextField * textfiledTwo;
}
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
    textfiledOne =[[UITextField alloc]initWithFrame:CGRectMake(accountImage.frame.origin.x + accountImage.frame.size.width+5, imageView_textfiled.frame.origin.y, imageView_textfiled.frame.size.width- (accountImage.frame.origin.x + accountImage.frame.size.width+5), imageView_textfiled.frame.size.height/2)];
    textfiledOne.placeholder = @"手机号";
    textfiledOne.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:textfiledOne];
    //密码图标
    UIImageView * passwordImage = [[UIImageView alloc]initWithFrame:CGRectMake(accountImage.frame.origin.x, imageView_textfiled.frame.origin.y+ imageView_textfiled.frame.size.height/2+15, 15, 15)];
    passwordImage.image = [UIImage imageNamed:@"lock"];
    [self.view addSubview:passwordImage];
    //密码文本框
    textfiledTwo = [[UITextField alloc]initWithFrame:CGRectMake(accountImage.frame.origin.x + accountImage.frame.size.width+5, imageView_textfiled.frame.origin.y + 44, imageView_textfiled.frame.size.width- (accountImage.frame.origin.x + accountImage.frame.size.width+5)-10, imageView_textfiled.frame.size.height/2)];
    textfiledTwo.placeholder = @"密码";
    [self.view addSubview:textfiledTwo];
    
    UIButton * hidenPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    hidenPassword.frame = CGRectMake(textfiledTwo.frame.origin.x+textfiledTwo.frame.size.width, textfiledTwo.frame.origin.y + 14, 20, 15);
    [hidenPassword setImage:[UIImage imageNamed:@"eye"] forState:UIControlStateNormal];
    [hidenPassword addTarget:self action:@selector(hidenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hidenPassword];
    
    //注册按钮
    UIButton * loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    loginButton.backgroundColor = RGB(125, 186, 201);
    loginButton.layer.cornerRadius = 5;
    loginButton.alpha = 0.55;
    [loginButton setTitle:@"下一步" forState:UIControlStateNormal];
    loginButton.frame = CGRectMake(imageView_textfiled.frame.origin.x, imageView_textfiled.frame.origin.y+imageView_textfiled.frame.size.height+65, imageView_textfiled.frame.size.width, 44);
    [loginButton addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    //说明文字
    NSString * whiteString = @"点击注册，代表同意";
    NSString * string = @"《美玩软件使用协议》";
    UILabel * captionsLabel = [[UILabel alloc]init];
    captionsLabel.textColor = [UIColor whiteColor];

    NSMutableAttributedString * changeColor = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@%@",whiteString,string]];
    NSRange range = [[changeColor string]rangeOfString:string];
    [changeColor addAttribute:NSForegroundColorAttributeName value:RGB(126, 206, 244) range:range];
    captionsLabel.attributedText = changeColor;
    captionsLabel.font = Font(12.0);
    
    CGSize size = [captionsLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:captionsLabel.font,NSFontAttributeName, nil]];
    
    captionsLabel.center = CGPointMake(width_screen/2, loginButton.frame.size.height+loginButton.frame.origin.y+40+size.height/2);
    captionsLabel.bounds = CGRectMake(0, 0, size.width, size.height);
    [self.view addSubview:captionsLabel];
    
}
-(void)hidenAction:(UIButton *)sender
{
    static int i = 0;
    i++;
    if (i%2==1) {
       textfiledTwo.secureTextEntry = YES;
    }else{
       textfiledTwo.secureTextEntry = NO;
        
    }
    
}
-(void)finishClick:(UIButton *)sender
{
    NSLog(@"完成");
    [self.view endEditing:YES];
}
-(void)registerAction:(UIButton *)sender
{
    NSLog(@"下一步%@---%@",textfiledOne.text,textfiledTwo.text);

    if ([textfiledOne.text isEqualToString:@""]||[textfiledTwo.text isEqualToString:@""]) {
        [self showMessage:@"手机号码或密码为空"];
    }else{
        NSString * regex = @"^(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
        NSPredicate * predicate = [NSPredicate predicateWithFormat:@"self matches %@",regex];
        if ([predicate evaluateWithObject:textfiledOne.text]) {
            [self showMessage:@"手机号码正确"];
            if (textfiledTwo.text.length>6) {
                //跳转获取验证码
                getNumberViewController * getnumber = [[getNumberViewController alloc]init];
                [self.navigationController pushViewController:getnumber animated:YES];
                
            }else{
                [self showMessage:@"密码太过简短不安全"];
            }
        }else{
            [self showMessage:@"请输入正确的手机号码"];
        }
    }
}
- (void)showMessage:(NSString *)message
{
    UIAlertController * alertView = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction * sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertView addAction:cancel];
    [alertView addAction:sure];
    [self presentViewController:alertView animated:YES completion:nil];

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
