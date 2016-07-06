//
//  PlayerInfoViewController.m
//  beautity_play
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "PlayerInfoViewController.h"
#import "playerInfoTableViewCell.h"

@interface PlayerInfoViewController ()<pushAndDismissViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *playerTableView;
@property (nonatomic, strong)UIView *editView;
@property (nonatomic, strong)UIButton *reportBtn;
@property (nonatomic, strong)UIButton *addFriend;

@end

@implementation PlayerInfoViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.editView.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.titleLabel.text = @"玩家资料";
    NSLog(@"%lu",naview.titleLabel.text.length);
    [naview.finished setTitle:@"举报" forState:UIControlStateNormal];
    [self.view addSubview:naview];
    
    [self playerTableView];
    // Do any additional setup after loading the view.
}

#pragma mark----tableview代理区
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableView *)playerTableView{
    if (!_playerTableView) {
        _playerTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, width_screen, height_screen-64) style:UITableViewStylePlain];
        _playerTableView.delegate = self;
        _playerTableView.dataSource = self;
        _playerTableView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_playerTableView];
    }
    return _playerTableView;
}

- (void)backPoPView:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)finishClick:(UIButton *)sender
{
    static int i = 0;
    i++;
    if (i%2==1) {
        self.editView = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-80, 55, 80, 61)];
        self.editView.backgroundColor = [UIColor whiteColor];
        self.editView.layer.cornerRadius = 5;
        self.editView.layer.masksToBounds = YES;
        self.editView.hidden = NO;
        [self.view addSubview:self.editView];
        
        self.reportBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
        self.reportBtn.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.reportBtn setTitle:@"举报" forState:UIControlStateNormal];
        [self.reportBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.reportBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        self.reportBtn.backgroundColor = NavColor;
        self.reportBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.reportBtn addTarget:self action:@selector(didTipReportBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.editView addSubview:self.reportBtn];
        
        self.addFriend = [[UIButton alloc]initWithFrame:CGRectMake(0, 31, 80, 30)];
        self.addFriend.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.addFriend setTitle:@"添加好友" forState:UIControlStateNormal];
        [self.addFriend setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.addFriend setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        self.addFriend.backgroundColor = NavColor;
        self.addFriend.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [self.addFriend addTarget:self action:@selector(didTipAddFriendBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.editView addSubview:self.addFriend];
        
    }else{
        self.editView.hidden = YES;
        [self.view reloadInputViews];
    }
}

-(void)didTipReportBtn:(UIButton *)sender{
    NSLog(@"举报");
}

-(void)didTipAddFriendBtn:(UIButton *)sender{
    NSLog(@"添加好友");
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
