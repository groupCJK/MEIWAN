//
//  mineViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "mineViewController.h"
#import "headerName.pch"
#import "CJKNavigationView.h"

#import "RecordCenterViewController.h"
#import "UserInfoViewController.h"

#import "MineViewTableViewCell.h"

@interface mineViewController ()<CJKNavigationViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *mineTableView;
@property (nonatomic, strong)NSArray *dataSource;
@property (nonatomic, strong)UIView *headView;
@property (nonatomic, strong) UIView *clearView;
@property (nonatomic, strong)UIView *editView;

@end

@implementation mineViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatasource];
    
    [self.view addSubview:self.clearView];
    
    self.mineTableView.tableHeaderView = self.headView;
    
    [self creat_navigationView];
    
    // Do any additional setup after loading the view.
}
- (void)creat_navigationView
{
    CJKNavigationView * baseView = [[CJKNavigationView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 35)];
    baseView.titleLabel.text = @"我的";
    baseView.delegate = self;
    baseView.leftButton.hidden = YES;
    [baseView.rightButton setImage:[UIImage imageNamed:@"list_2"] forState:UIControlStateNormal];
    
    [self.view addSubview:baseView];
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
    MineViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MineViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *sectionArray = self.dataSource[indexPath.section];
    NSDictionary *dic = sectionArray[indexPath.row];
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.titleImage.image = [UIImage imageNamed:dic[@"image"]];
    cell.titleLabel.text = dic[@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        UserInfoViewController *userInfoCtr = [[UserInfoViewController alloc] init];
        userInfoCtr.title = @"个人资料";
        [self presentViewController:userInfoCtr animated:YES completion:nil];
    }else if (indexPath.row == 4){
        RecordCenterViewController *recordCtr = [[RecordCenterViewController alloc] init];
        recordCtr.title = @"纪录中心";
        [self presentViewController:recordCtr animated:YES completion:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableView *)mineTableView{
    if (!_mineTableView) {
        _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 35, width_screen, height_screen-75) style:UITableViewStylePlain];
        _mineTableView.dataSource = self;
        _mineTableView.delegate = self;
        _mineTableView.backgroundColor = [UIColor whiteColor];
        _mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_mineTableView];
    }
    return _mineTableView;
}

- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width_screen, 100)];
        _headView.backgroundColor = [UIColor orangeColor];
        
        UIImageView *userHeadImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        userHeadImage.layer.masksToBounds = YES;
        userHeadImage.layer.cornerRadius = 40;
        userHeadImage.backgroundColor = [UIColor blackColor];
        [_headView addSubview:userHeadImage];
        UITapGestureRecognizer *headImageGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapHeadImageFrom:)];
        headImageGesture.numberOfTapsRequired = 1;
        [userHeadImage addGestureRecognizer:headImageGesture];
        
        
        UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(userHeadImage.frame.origin.x+userHeadImage.frame.size.width+15, (userHeadImage.frame.size.height+10)/2, 90, 20)];
        userName.text = @"老储";
        [_headView addSubview:userName];
        
        UILabel *sign = [[UILabel alloc] initWithFrame:CGRectMake(userHeadImage.frame.origin.x+userHeadImage.frame.size.width+15, userName.frame.origin.y+userName.frame.size.height+10, width_screen-80-40, 15)];
        sign.font = [UIFont systemFontOfSize:12];
        sign.text = @"唧唧复唧唧，木兰当户织唧唧复唧唧，木兰当户织";
        [_headView addSubview:sign];
        
        UIImageView *editImage = [[UIImageView alloc]initWithFrame:CGRectMake(width_screen-50, (_headView.frame.size.height+40)/4, 40, 40)];
        editImage.backgroundColor = [UIColor purpleColor];
        [_headView addSubview:editImage];
        
    }
    return _headView;
}

- (void)loadDatasource{
    NSArray *data = @[@{@"image":@"near2",
                        @"title":@"个人资料"},
                      @{@"image":@"peiwan_dongtai",
                        @"title":@"我的动态"},
                      @{@"image":@"peiwan_smile",
                        @"title":@"达人认证"},
                      @{@"image":@"peiwan_wallet",
                        @"title":@"我的钱包"},
                      @{@"image":@"order",
                        @"title":@"纪录中心"},
                      @{@"image":@"wangzhe",
                        @"title":@"战绩查询"}];
    self.dataSource = @[data];
}

- (void)handleSingleTapHeadImageFrom:(UITapGestureRecognizer *)recognizer {
    NSLog(@"1111");
}


#pragma mark----导航栏按钮函数
-(void)leftButtonClick:(UIButton *)sender
{
    NSLog(@"左");
}
-(void)rightButtonClick:(UIButton *)sender
{
    self.editView = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-120, 55, 120, 40)];
    self.editView.backgroundColor = [UIColor grayColor];
    self.editView.layer.cornerRadius = 5;
    self.editView.layer.masksToBounds = YES;
    [self.view addSubview:self.editView];
    
    UIButton *opinitonBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 120, 40)];
    opinitonBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [opinitonBtn addTarget:self action:@selector(touchOpinitonBtn) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *opinitonIg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    opinitonIg.image = [UIImage imageNamed:@"peiwan_close"];
    UILabel *opinitonLab = [[UILabel alloc]initWithFrame:CGRectMake(opinitonIg.frame.origin.x+opinitonIg.frame.size.width+10, 10, 120, 20)];
    opinitonLab.text = @"退出登录";
    [opinitonBtn addSubview:opinitonIg];
    [opinitonBtn addSubview:opinitonLab];
    [self.editView addSubview:opinitonBtn];
    
    NSLog(@"右");
}

-(void)touchOpinitonBtn{
    NSLog(@"___退出登录");
}

#pragma mark----状态栏
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
