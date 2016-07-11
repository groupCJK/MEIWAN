//
//  UserInfoViewController.m
//  beautity_play
//
//  Created by mac on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "UserInfoViewController.h"
#import "pushAndDismissView.h"
#import "UserInfoTableViewCell.h"

@interface UserInfoViewController ()<pushAndDismissViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *userInfoTableView;
@property (nonatomic, strong)NSArray *dataSource;
@property (nonatomic, strong)UIView *userInfoHeadView;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self userInfoTableView];
    
    [self loadDatasource];
    
    self.userInfoTableView.tableHeaderView = self.userInfoHeadView;
    
    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.titleLabel.text = @"个人资料";
    NSLog(@"%lu",naview.titleLabel.text.length);
    [naview.finished setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:naview];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = self.dataSource[section];
    return sectionArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserInfoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UserInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSArray *sectionArray = self.dataSource[indexPath.section];
    NSDictionary *dic = sectionArray[indexPath.row];
    cell.userInfoTitle.text = dic[@"title"];
    if (indexPath.row == 0) {
        cell.userInfoEdit.text = @"";
        cell.userInfoEdit.hidden = NO;
        [cell.userInfoEdit addTarget:self action:@selector(userInfoEdit:) forControlEvents:UIControlEventEditingChanged];
    }else if (indexPath.row == 1){
        cell.userInfoDetail.text = @"12331";
    }else if (indexPath.row == 2){
        cell.userInfoDetail.text = @"女";
    }else if (indexPath.row == 3){
        cell.userInfoDetail.text = @"22";
    }else if (indexPath.row == 4){
        cell.userInfoDetail.text = @"300";
        cell.userInfoDetail.textColor = [UIColor redColor];
    }else if (indexPath.row == 5){
        cell.userInfoEdit.hidden = YES;
        cell.userInfoEditSign.hidden = NO;
        cell.userInfoEditSign.text = @"";
        [cell.userInfoEditSign addTarget:self action:@selector(userInfoEditSign:) forControlEvents:UIControlEventEditingChanged];
    }else if (indexPath.row == 6){
        cell.userInfoDetail.text = @"标签";
    }
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1) {
        NSLog(@"用户ID不能修改");
    }else if (indexPath.row == 2){
        NSLog(@"性别不能修改");
    }else if (indexPath.row == 3){
        NSLog(@"年龄不能修改");
    }else if (indexPath.row == 4){
        NSLog(@"热度不能修改");
    }else if(indexPath.row == 6){
        NSLog(@"选择标签");
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)userInfoEditSign:(UITextField *)textField
{
    if (textField.text.length > 20) {
        textField.text = [textField.text substringToIndex:20];
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"签名不能多于20个字符串" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertview show];
    }
    
    NSLog(@"%lu",textField.text.length);
}


- (void)userInfoEdit:(UITextField *)textField
{
    if (textField.text.length > 6) {
        textField.text = [textField.text substringToIndex:6];
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"昵称不能大于六个字符串" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertview show];
    }
    
    NSLog(@"%lu",textField.text.length);
}


- (UITableView *)userInfoTableView{
    if (!_userInfoTableView) {
        _userInfoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, width_screen, height_screen) style:UITableViewStylePlain];
        _userInfoTableView.delegate = self;
        _userInfoTableView.dataSource = self;
        _userInfoTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _userInfoTableView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_userInfoTableView];
    }
    return _userInfoTableView;
}

- (UIView *)userInfoHeadView{
    if (!_userInfoHeadView) {
        _userInfoHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width_screen, 110)];
        
        UIImageView *userInfoHead = [[UIImageView alloc]initWithFrame:CGRectMake((_userInfoHeadView.frame.size.height+110)/2, 10, 90, 90)];
        userInfoHead.backgroundColor = [UIColor orangeColor];
        userInfoHead.layer.masksToBounds = YES;
        userInfoHead.layer.cornerRadius = 45;
        [_userInfoHeadView addSubview:userInfoHead];
        
        UIButton *prompt = [[UIButton alloc] initWithFrame:CGRectMake(userInfoHead.frame.origin.x+userInfoHead.frame.size.height+2,userInfoHead.frame.origin.y+userInfoHead.frame.size.width-10,60,10)];
        [prompt setTitle:@"更换头像" forState:UIControlStateNormal];
        [prompt setTitleColor:NavColor forState:UIControlStateNormal];
        prompt.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [prompt addTarget:self action:@selector(didTipPromptButton:) forControlEvents:UIControlEventTouchDownRepeat];
        [_userInfoHeadView addSubview:prompt];
        
    }
    return _userInfoHeadView;
}

- (void)loadDatasource{
    NSArray *data = @[@{@"title":@"昵称:"},
                      @{@"title":@"用户ID:"},
                      @{@"title":@"性别:"},
                      @{@"title":@"年龄:"},
                      @{@"title":@"热度:"},
                      @{@"title":@"签名:"},
                      @{@"title":@"标签:"}];
    self.dataSource = @[data];
}

- (void)didTipPromptButton:(UIButton *)sender{
    NSLog(@"点击更换头像");
}

#pragma mark ---- pushAndDismissView代理

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