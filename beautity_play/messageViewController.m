//
//  messageViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "messageViewController.h"
#import "headerName.pch"
#import "CJKNavigationView.h"

#import "MessageTableViewCell.h"

@interface messageViewController ()<CJKNavigationViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *messageTableView;
@property (nonatomic, strong)NSArray *dataSource;

@end

@implementation messageViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatasource];
    
    [self messageTableView];
    
    [self creat_navigationView];
    // Do any additional setup after loading the view.
}
- (void)creat_navigationView
{
    CJKNavigationView * baseView = [[CJKNavigationView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 35)];
    baseView.delegate = self;
    baseView.titleLabel.text = @"消息";
    baseView.leftButton.hidden = YES;
    [self.view addSubview:baseView];
}

#pragma mark----UITableViewdelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = self.dataSource[section];
    return sectionArray.count;}

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
    MessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *sectionArray = self.dataSource[indexPath.section];
    NSDictionary *dic = sectionArray[indexPath.row];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = dic[@"title"];
        cell.titleImage.image = [UIImage imageNamed:dic[@"image"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark----Get**set

- (UITableView *)messageTableView{
    if (!_messageTableView) {
        _messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0 , 36, width_screen, height_screen-76) style:UITableViewStylePlain];
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.backgroundColor = [UIColor whiteColor];
        _messageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_messageTableView];
    }
    return _messageTableView;
}

- (void)loadDatasource{
    NSArray *data = @[@{@"image":@"peiwan_message",
                        @"title":@"消息"},
                      @{@"image":@"peiwan_contact",
                        @"title":@"好友列表"},
                      @{@"image":@"peiwan_invite",
                        @"title":@"邀请我的"},
                      @{@"image":@"near2",
                        @"title":@"黑名单"}];
    self.dataSource = @[data];
}

#pragma mark----导航栏按钮函数
-(void)leftButtonClick:(UIButton *)sender
{
    NSLog(@"左");
}
-(void)rightButtonClick:(UIButton *)sender
{
    NSLog(@"右");
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
