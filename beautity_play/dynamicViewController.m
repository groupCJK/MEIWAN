//
//  dynamicViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "dynamicViewController.h"
#import "headerName.pch"
#import "CJKNavigationView.h"
#import "dynamicTableViewCell.h"

@interface dynamicViewController ()<CJKNavigationViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
}

@property (nonatomic, strong)UIView *editView;
@property (nonatomic, strong)UIButton *opinitonBtn;

@end

@implementation dynamicViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creat_navigationView];
    [self creat_tableView];
    // Do any additional setup after loading the view.
}
- (void)creat_navigationView
{
    CJKNavigationView * baseView = [[CJKNavigationView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 35)];
    baseView.leftButton.hidden = YES;
    baseView.titleLabel.text = @"动态";
    baseView.delegate = self;
    [baseView.rightButton setTitle:@"＋" forState:UIControlStateNormal];
    [baseView.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:baseView];
}
- (void)creat_tableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 55, width_screen, height_screen-55) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
#pragma mark----tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    dynamicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[dynamicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.MessageCount.text = @"100";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

#pragma mark----导航栏按钮函数
-(void)leftButtonClick:(UIButton *)sender
{
    NSLog(@"左");
}
-(void)rightButtonClick:(UIButton *)sender
{
    static int i = 0;
    i++;
    if (i%2==1) {
        self.editView = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-80, 55, 80, 30)];
        self.editView.backgroundColor = [UIColor grayColor];
        self.editView.layer.cornerRadius = 5;
        self.editView.layer.masksToBounds = YES;
        [self.view addSubview:self.editView];
        
        self.opinitonBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
        self.opinitonBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.opinitonBtn setTitle:@"发布动态" forState:UIControlStateNormal];
        [self.opinitonBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.opinitonBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        self.opinitonBtn.backgroundColor = NavColor;
        self.opinitonBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.opinitonBtn addTarget:self action:@selector(didTipOpinitonBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.editView addSubview:self.opinitonBtn];
        [self.editView addSubview:self.opinitonBtn];
        self.editView.hidden = NO;
    }else{
        self.editView.hidden = YES;
        [self.view reloadInputViews];
    }
}

-(void)didTipOpinitonBtn:(UIButton *)sender{
    NSLog(@"发布动态");
}

#pragma mark----状态栏
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
