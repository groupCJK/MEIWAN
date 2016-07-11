//
//  PlayerAuditViewController.m
//  beautity_play
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "PlayerAuditViewController.h"

@interface PlayerAuditViewController ()<pushAndDismissViewDelegate,UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *time;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UIImageView *addPhoto1;
@property (weak, nonatomic) IBOutlet UIImageView *addPhoto2;
@property (weak, nonatomic) IBOutlet UILabel *SugaoLabel;
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
    
    NSString *agreement = @"当你使用本软件代表你同意";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:agreement];
    //设置：在0-3个单位长度内的内容显示成红色
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(10, 2)];
    
    UILabel *agreementLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.SugaoLabel.frame.origin.x, self.SugaoLabel.frame.origin.y+self.SugaoLabel.frame.size.height+20, 145, 20)];
    agreementLabel.text = @"当你使用本软件代表你同意";
    agreementLabel.attributedText = str;
    agreementLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.view addSubview:agreementLabel];
    
    UIButton *agreementurlButton = [[UIButton alloc] initWithFrame:CGRectMake(agreementLabel.frame.origin.x+agreementLabel.frame.size.width, agreementLabel.frame.origin.y, 100, 20)];
    agreementurlButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [agreementurlButton setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"《美玩达人协议》"];
    NSRange titleRange = {0,[title length]};
    [title addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:titleRange];
    [agreementurlButton setAttributedTitle:title
                                  forState:UIControlStateNormal];
    [agreementurlButton addTarget:self action:@selector(didTapagreementUrl:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:agreementurlButton];
    
    UITapGestureRecognizer *addphone1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAddPhoto1:)];
    self.addPhoto1.userInteractionEnabled = YES;
    addphone1.numberOfTouchesRequired = 1; //手指数
    addphone1.numberOfTapsRequired = 1; //tap次数
    addphone1.delegate= self;
    [self.addPhoto1 addGestureRecognizer:addphone1];
    UITapGestureRecognizer *addphone2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAddPhoto2:)];
    self.addPhoto2.userInteractionEnabled = YES;
    addphone2.numberOfTouchesRequired = 1; //手指数
    addphone2.numberOfTapsRequired = 1; //tap次数
    addphone2.delegate= self;
    [self.addPhoto2 addGestureRecognizer:addphone2];
    // Do any additional setup after loading the view from its nib.
}

- (void)loadSetTextDelegate{
    self.time.textAlignment = NSTextAlignmentLeft;
    self.time.placeholder = @"(例如:看电影、玩游戏)";
    [self.time setValue:[UIColor colorWithWhite:1 alpha:0.6] forKeyPath:@"_placeholderLabel.textColor"];
    [self.time setValue:[UIFont boldSystemFontOfSize:11.0f] forKeyPath:@"_placeholderLabel.font"];
    self.time.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    NSMutableParagraphStyle *style = [self.time.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = self.time.font.lineHeight - (self.time.font.lineHeight - [UIFont systemFontOfSize:11.0f].lineHeight) / 2.0;
    //[UIFont systemFontOfSize:13.0f]是设置的placeholder的字体
    self.time.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.time.placeholder
                                                                      attributes:@{NSParagraphStyleAttributeName : style}];
    
    self.address.textAlignment = NSTextAlignmentLeft;
    self.address.placeholder = @"请填写详细地址";
    [self.address setValue:[UIColor colorWithWhite:1 alpha:0.6]  forKeyPath:@"_placeholderLabel.textColor"];
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
    [self.phone setValue:[UIColor colorWithWhite:1 alpha:0.6]  forKeyPath:@"_placeholderLabel.textColor"];
    [self.phone setValue:[UIFont boldSystemFontOfSize:11.0f] forKeyPath:@"_placeholderLabel.font"];
    self.phone.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    NSMutableParagraphStyle *style3 = [self.phone.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = self.phone.font.lineHeight - (self.phone.font.lineHeight - [UIFont systemFontOfSize:11.0f].lineHeight) / 2.0;
    //[UIFont systemFontOfSize:13.0f]是设置的placeholder的字体
    self.phone.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.phone.placeholder
                                                                       attributes:@{NSParagraphStyleAttributeName : style3}];
}

- (void)didTapAddPhoto1:(UIGestureRecognizer *)recognizer{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *home1Action) {
        //处理点击拍照
        NSLog(@"拍照");
    }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"相册" style: UIAlertActionStyleDefault handler:^(UIAlertAction *home2Action) {
        //处理点击拍照
        NSLog(@"相册");
    }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *cancelAction) {
        //处理点击拍照
        NSLog(@"取消");
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
//    UIAlertAction *home1Action = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:home1Action];
    

    
//    UIAlertAction *home2Action = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:home2Action];

    //取消style:UIAlertActionStyleDefault
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:cancelAction];

}

- (void)didTapAddPhoto2:(UIGestureRecognizer *)recognizer{
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    
//    UIAlertAction *home1Action = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:home1Action];
//    UIAlertAction *home2Action = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:home2Action];
//    
//    //取消style:UIAlertActionStyleDefault
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
//    [alertController addAction:cancelAction];
    [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *home1Action) {
        //处理点击拍照
        NSLog(@"拍照2");
    }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"相册" style: UIAlertActionStyleDefault handler:^(UIAlertAction *home2Action) {
        //处理点击拍照
        NSLog(@"相册2");
    }]];
    
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *cancelAction) {
        //处理点击拍照
        NSLog(@"取消2");
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)actionSheet:(UIAlertAction *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"1");
    }else if (buttonIndex == 1) {
        NSLog(@"2");
    }
}
- (void)didTapagreementUrl:(UIButton *)sender{
    NSLog(@"美玩协议连接地址");
}

-(void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)finishClick:(UIButton *)sender
{
    NSLog(@"提交");
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

