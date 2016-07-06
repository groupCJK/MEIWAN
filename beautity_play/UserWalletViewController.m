
//
//  UserWalletViewController.m
//  beautity_play
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "UserWalletViewController.h"
#import "UserWalletTableViewCell.h"
#import "WalletBalanceViewController.h"

@interface UserWalletViewController ()<pushAndDismissViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *walletTableView;

@end

@implementation UserWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self walletTableView];
    
    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.titleLabel.text = @"个人资料";
    NSLog(@"%u",naview.titleLabel.text.length);
    naview.finished.hidden = YES;
    [self.view addSubview:naview];
    // Do any additional setup after loading the view.
}

#pragma mark----tableview代理区
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserWalletTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UserWalletTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0) {
        cell.moneyTitle.text = @"余额";
        cell.money.hidden = NO;
        cell.money.text = @"40.0";
        cell.withdrawalTitle.text = @"提现";
        cell.withdrawalTitle.textColor = NavColor;
    }else if (indexPath.section == 1){
        cell.moneyTitle.text = @"提现记录";
        cell.withdrawalTitle.text = @">";
        cell.withdrawalTitle.textAlignment = NSTextAlignmentCenter;
        cell.withdrawalTitle.textColor = NavColor;
    }else if (indexPath.section == 2){
        cell.moneyTitle.text = @"已绑定支付宝账号";
        cell.moneyTitle.font = [UIFont systemFontOfSize:14.0f];
        cell.moneyTitle.textColor = NavColor;
        cell.withdrawalTitle.textColor = NavColor;
        cell.withdrawalTitle.text = @"更换 >";
        cell.withdrawalTitle.font = [UIFont systemFontOfSize:14.0f];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        WalletBalanceViewController *balanceCtr = [[WalletBalanceViewController alloc] init];
        balanceCtr.title = @"我的余额";
        [self presentViewController:balanceCtr animated:YES completion:nil];
    }else if (indexPath.section == 2){
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"更换账号" message:@"请输入账号" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertview.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alertview show];
    }
}

- (UITableView *)walletTableView{
    if (!_walletTableView) {
        _walletTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, width_screen, height_screen) style:UITableViewStylePlain];
        _walletTableView.delegate = self;
        _walletTableView.dataSource = self;
        [self.view addSubview:_walletTableView];
    }
    return _walletTableView;
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
