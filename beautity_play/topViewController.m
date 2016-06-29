//
//  topViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "topViewController.h"
#import "headerName.pch"
#import "CJKNavigationView.h"
#import "TopViewTableViewCell.h"
//#import "TopHeaderView.h"

@interface topViewController ()<CJKNavigationViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *topTableView;
@property (nonatomic, strong)UIView *topTableViewHeadView;


@end

@implementation topViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 55, width_screen, height_screen)];
    [self.view addSubview:view];
    
    self.topTableView.tableHeaderView = self.topTableViewHeadView;
    
    [self creat_navigationView];
    // Do any additional setup after loading the view.
}

- (void)creat_navigationView
{
    CJKNavigationView * baseView = [[CJKNavigationView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 35)];
    baseView.delegate = self;
    baseView.titleLabel.text = @"排行榜";
    [baseView.rightButton setBackgroundImage:[UIImage imageNamed:@"peiwan_ask"] forState:UIControlStateNormal];
    [self.view addSubview:baseView];
}

#pragma mark----tableviewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[TopViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

#pragma mark----导航栏按钮函数
-(void)leftButtonClick:(UIButton *)sender
{
    NSLog(@"左");
}

-(void)rightButtonClick:(UIButton *)sender
{
    UIAlertController *hotRuleController = [UIAlertController alertControllerWithTitle:@"热度规则" message:@"热度规则：每成交一单，获取订单金额除以10的热度；每发表一篇动态，获得1热度，4小时不重复增加；动态每增加一个赞，获得1热度，动态每有1个新的用户评论，获得1热度。另每隔1天未上线，会减少5热度。如果受到投诉，会酌情减少热度" preferredStyle:UIAlertControllerStyleAlert];
    
    [hotRuleController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"＊＊＊确定＊＊＊");
    }]];
    
    [self presentViewController:hotRuleController animated:true completion:nil];
}

- (UITableView *)topTableView{
    if (!_topTableView) {
        _topTableView = [[UITableView alloc] initWithFrame:CGRectMake(0 , 55, width_screen, height_screen-95) style:UITableViewStylePlain];
        _topTableView.delegate = self;
        _topTableView.dataSource = self;
        _topTableView.backgroundColor = baseColor;
        _topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_topTableView];
    }
    return _topTableView;
}

- (UIView *)topTableViewHeadView{
    if (!_topTableViewHeadView) {
        _topTableViewHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width_screen, 413)];
        _topTableViewHeadView.backgroundColor = baseColor;
        
        UIImageView *hot1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width_screen, 214)];
        hot1.backgroundColor = [UIColor orangeColor];
        
        UIImageView *hot2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 220, (width_screen/5)*3-5, _topTableViewHeadView.frame.size.height-hot1.frame.size.height-8)];
        hot2.backgroundColor = [UIColor blackColor];
        
        UIImageView *hot3 = [[UIImageView alloc] initWithFrame:CGRectMake(hot2.frame.origin.x+hot2.frame.size.width+5, 220, width_screen-hot2.frame.size.width-5, hot2.frame.size.height)];
        hot3.backgroundColor = [UIColor purpleColor];
        
        [_topTableViewHeadView addSubview:hot1];
        [_topTableViewHeadView addSubview:hot2];
        [_topTableViewHeadView addSubview:hot3];
        
    }
    //        if (self.headViewDataArray.count == 3) {
    //            TopHeaderView * firstView = [[[NSBundle mainBundle]loadNibNamed:@"TopHeaderView" owner:self options:nil]firstObject];
    //            firstView.delegate = self;
    //            firstView.playerInfo = self.headViewDataArray[0];
    //            firstView.ranklab.text = @"1";
    //            firstView.ranklab.textColor = [UIColor whiteColor];
    //            [firstView.ranklab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    //
    //            firstView.rankImage.image = [UIImage imageNamed:@"first_1"];
    //            firstView.frame = CGRectMake(5, 5,width_screen-10, height_screen-10);
    //
    //            TopHeaderView * secondView = [[[NSBundle mainBundle]loadNibNamed:@"TopHeaderView" owner:self options:nil]firstObject];
    //            secondView.delegate = self;
    //            secondView.playerInfo = self.headViewDataArray[1];
    //            secondView.ranklab.text = @"2";
    //            secondView.ranklab.textColor = [UIColor purpleColor];
    //            [secondView.ranklab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    //            secondView.rankImage.image = [UIImage imageNamed:@"first_4"];
    //            secondView.frame = CGRectMake(5, width_screen, (height_screen-15)/2.0, (width_screen-15)/2.0);
    //
    //            TopHeaderView * thirdView = [[[NSBundle mainBundle]loadNibNamed:@"TopHeaderView" owner:self options:nil]firstObject];
    //            thirdView.delegate = self;
    //            thirdView.playerInfo = self.headViewDataArray[2];
    //            thirdView.ranklab.text = @"3";
    //            [thirdView.ranklab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    //            thirdView.ranklab.textColor = [UIColor whiteColor];
    //            thirdView.rankImage.image = [UIImage imageNamed:@"first_2"];
    //            thirdView.frame = CGRectMake((width_screen-15)/2.0+10, width_screen, (width_screen-15)/2.0, (width_screen-15)/2.0);
    //            [_topTableViewHeadView addSubview:firstView];
    //            [_topTableViewHeadView addSubview:secondView];
    //            [_topTableViewHeadView addSubview:thirdView];
    //            
    //        }
    return _topTableViewHeadView;
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
