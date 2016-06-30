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

@interface topViewController ()<CJKNavigationViewDelegate,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong)UITableView *topTableView;
@property (nonatomic, strong)UIView *topTableViewHeadView;
@property (nonatomic, strong)UIView *toplistView;


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
    
    [self toplistView];
    
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

#pragma mark **Get * Set**

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
        
        UIImageView *rankImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        rankImage.image = [UIImage imageNamed:@"first_1"];
        [hot1 addSubview:rankImage];
        UILabel *rankLabel = [[UILabel alloc]initWithFrame:CGRectMake(11, 15, 20, 20)];
        rankLabel.text = @"1";
        rankLabel.textAlignment = NSTextAlignmentCenter;
        rankLabel.font = [UIFont systemFontOfSize:12];
        [rankImage addSubview:rankLabel];
        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0,hot1.frame.size.height-hot1.frame.size.height/4, width_screen, hot1.frame.size.height/4)];
        blackView.backgroundColor = [UIColor blackColor];
        blackView.alpha = 0.5;
        [hot1 addSubview:blackView];
        
        UILabel *nick = [[UILabel alloc]init];
        nick.font = [UIFont systemFontOfSize:13];
        nick.text = @"花木兰";
        CGSize nickSize = [nick.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:nick.font,NSFontAttributeName, nil]];
        CGFloat nameH = nickSize.height;
        CGFloat nameW = nickSize.width;
        nick.frame = CGRectMake(10, 10, nameW,nameH);
        nick.textColor = [UIColor whiteColor];
        [blackView addSubview:nick];
        
        UILabel *ageLabel = [[UILabel alloc] init];
        ageLabel.text = @"22";
        ageLabel.textColor = [UIColor whiteColor];
        ageLabel.font = [UIFont systemFontOfSize:14];
        CGSize ageSize = [ageLabel.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ageLabel.font,NSFontAttributeName, nil]];
        CGFloat ageW = ageSize.width;
        ageLabel.frame = CGRectMake(nick.frame.origin.x+ nameW+4, 10, ageW, nameH);
        [blackView addSubview:ageLabel];
        
        UIImageView *sexImage = [[UIImageView alloc] initWithFrame:CGRectMake(ageLabel.frame.origin.x+ageW+4, 10, 15, 15)];
        sexImage.image = [UIImage imageNamed:@"nansheng_logo"];
        [blackView addSubview:sexImage];
        
        UIImageView *locationImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, nick.frame.origin.y+nameH+6, 20, 20)];
        locationImage.image = [UIImage imageNamed:@"juli"];
        [blackView addSubview:locationImage];
        
        UILabel *locationDetail = [[UILabel alloc] init];
        NSString *locationNum = @"10.6";
        NSString *location = @"km";
        locationDetail.font = [UIFont systemFontOfSize:13];
        locationDetail.text = [NSString stringWithFormat:@"%@%@",locationNum,location];
        CGSize locationSize = [locationDetail.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:locationDetail.font,NSFontAttributeName, nil]];
        CGFloat locationH = locationSize.height;
        CGFloat locationW = locationSize.width;
        locationDetail.frame = CGRectMake(locationImage.frame.origin.x+locationImage.frame.size.width+4, nick.frame.origin.y+nameH+7, locationW,locationH);
        locationDetail.textColor = [UIColor whiteColor];
        [blackView addSubview:locationDetail];
        
        UIImageView *hotImage = [[UIImageView alloc] initWithFrame:CGRectMake(blackView.frame.size.width-50, 5, 20, blackView.frame.size.height-10)];
        hotImage.image = [UIImage imageNamed:@"hot"];
        [blackView addSubview:hotImage];
        
        UILabel *hotDetail = [[UILabel alloc] init];
        hotDetail.text = @"123";
        hotDetail.font = [UIFont systemFontOfSize:12];
        CGSize hotSize = [hotDetail.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:hotDetail.font,NSFontAttributeName, nil]];
        CGFloat hotH = hotSize.height;
        CGFloat hotW = hotSize.width;
        hotDetail.textColor = [UIColor whiteColor];
        hotDetail.frame = CGRectMake(hotImage.frame.origin.x+hotImage.frame.size.width, 10, hotW, hotH);
        [blackView addSubview:hotDetail];
        
        UIImageView *hot2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 220, (width_screen/5)*3-5, _topTableViewHeadView.frame.size.height-hot1.frame.size.height-8)];
        hot2.backgroundColor = [UIColor purpleColor];
        UIImageView *rankImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        rankImage2.image = [UIImage imageNamed:@"first_2"];
        [hot2 addSubview:rankImage2];
        UILabel *rankLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(11, 15, 20, 20)];
        rankLabel2.text = @"2";
        rankLabel2.textAlignment = NSTextAlignmentCenter;
        rankLabel2.font = [UIFont systemFontOfSize:12];
        [rankImage2 addSubview:rankLabel2];
        UIView *blackView2 = [[UIView alloc] initWithFrame:CGRectMake(0,hot2.frame.size.height-hot2.frame.size.height/4, hot2.frame.size.width, hot2.frame.size.height/4)];
        blackView2.backgroundColor = [UIColor blackColor];
        blackView2.alpha = 0.5;
        [hot2 addSubview:blackView2];
        
        UILabel *nick2 = [[UILabel alloc]init];
        nick2.font = [UIFont systemFontOfSize:13];
        nick2.text = @"曹小草是你爹";
        CGSize nick2Size = [nick2.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:nick2.font,NSFontAttributeName, nil]];
        CGFloat name2H = nick2Size.height;
        CGFloat name2W = nick2Size.width;
        nick2.frame = CGRectMake(10, 10, name2W,name2H);
        nick2.textColor = [UIColor whiteColor];
        [blackView2 addSubview:nick2];
        
        UILabel *ageLabel2 = [[UILabel alloc] init];
        ageLabel2.text = @"22";
        ageLabel2.textColor = [UIColor whiteColor];
        ageLabel2.font = [UIFont systemFontOfSize:14];
        CGSize age2Size = [ageLabel2.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ageLabel2.font,NSFontAttributeName, nil]];
        CGFloat age2W = age2Size.width;
        ageLabel2.frame = CGRectMake(nick2.frame.origin.x+ name2W+4, 11, age2W, name2H);
        [blackView2 addSubview:ageLabel2];
        
        UIImageView *sexImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(ageLabel2.frame.origin.x+age2W+4, 10, 15, 15)];
        sexImage2.image = [UIImage imageNamed:@"nvsheng_logo"];
        [blackView2 addSubview:sexImage2];
        
        UIImageView *locationImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, nick.frame.origin.y+name2H+6, 20, 20)];
        locationImage2.image = [UIImage imageNamed:@"juli"];
        [blackView2 addSubview:locationImage2];
        
        UILabel *locationDetail2 = [[UILabel alloc] init];
        NSString *locationNum2 = @"10.6";
        NSString *location2 = @"km";
        locationDetail2.font = [UIFont systemFontOfSize:13];
        locationDetail2.text = [NSString stringWithFormat:@"%@%@",locationNum2,location2];
        CGSize location2Size = [locationDetail2.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:locationDetail2.font,NSFontAttributeName, nil]];
        CGFloat location2H = location2Size.height;
        CGFloat location2W = location2Size.width;
        locationDetail2.frame = CGRectMake(locationImage2.frame.origin.x+locationImage2.frame.size.width+4, nick2.frame.origin.y+name2H+7, location2W,location2H);
        locationDetail2.textColor = [UIColor whiteColor];
        [blackView2 addSubview:locationDetail2];
        
        UIImageView *hotImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(blackView2.frame.size.width-50, 5, 20, blackView2.frame.size.height-10)];
        hotImage2.image = [UIImage imageNamed:@"hot"];
        [blackView2 addSubview:hotImage2];
        
        UILabel *hotDetail2 = [[UILabel alloc] init];
        hotDetail2.text = @"123";
        hotDetail2.font = [UIFont systemFontOfSize:12];
        CGSize hot2Size = [hotDetail2.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:hotDetail2.font,NSFontAttributeName, nil]];
        CGFloat hot2H = hot2Size.height;
        CGFloat hot2W = hot2Size.width;
        hotDetail2.textColor = [UIColor whiteColor];
        hotDetail2.frame = CGRectMake(hotImage2.frame.origin.x+hotImage2.frame.size.width, 10, hot2W, hot2H);
        [blackView2 addSubview:hotDetail2];
        
        
        UIImageView *hot3 = [[UIImageView alloc] initWithFrame:CGRectMake(hot2.frame.origin.x+hot2.frame.size.width+5, 220, width_screen-hot2.frame.size.width-5, hot2.frame.size.height)];
        hot3.backgroundColor = [UIColor purpleColor];
        UIImageView *rankImage3 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        rankImage3.image = [UIImage imageNamed:@"first_4"];
        [hot3 addSubview:rankImage3];
        UILabel *rankLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(11, 15, 20, 20)];
        rankLabel3.text = @"3";
        rankLabel3.textAlignment = NSTextAlignmentCenter;
        rankLabel3.font = [UIFont systemFontOfSize:12];
        [rankImage3 addSubview:rankLabel3];
        UIView *blackView3 = [[UIView alloc] initWithFrame:CGRectMake(0,hot3.frame.size.height-hot3.frame.size.height/4, hot3.frame.size.width, hot3.frame.size.height/4)];
        blackView3.backgroundColor = [UIColor blackColor];
        blackView3.alpha = 0.5;
        [hot3 addSubview:blackView3];
        
        UILabel *nick3 = [[UILabel alloc]init];
        nick3.font = [UIFont systemFontOfSize:13];
        nick3.text = @"曹小草";
        CGSize nick3Size = [nick3.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:nick3.font,NSFontAttributeName, nil]];
        CGFloat name3H = nick3Size.height;
        CGFloat name3W = nick3Size.width;
        nick3.frame = CGRectMake(10, 10, name3W,name3H);
        nick3.textColor = [UIColor whiteColor];
        [blackView3 addSubview:nick3];
        
        UILabel *ageLabel3 = [[UILabel alloc] init];
        ageLabel3.text = @"22";
        ageLabel3.textColor = [UIColor whiteColor];
        ageLabel3.font = [UIFont systemFontOfSize:14];
        CGSize age3Size = [ageLabel3.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ageLabel3.font,NSFontAttributeName, nil]];
        CGFloat age3W = age3Size.width;
        ageLabel3.frame = CGRectMake(nick3.frame.origin.x+ name3W+4, 10, age3W, name3H);
        [blackView3 addSubview:ageLabel3];
        
        UIImageView *sexImage3 = [[UIImageView alloc] initWithFrame:CGRectMake(ageLabel3.frame.origin.x+age3W+4, 10, 15, 15)];
        sexImage3.image = [UIImage imageNamed:@"nvsheng_logo"];
        [blackView3 addSubview:sexImage3];
        
        UIImageView *locationImage3 = [[UIImageView alloc] initWithFrame:CGRectMake(10, nick3.frame.origin.y+name3H+6, 20, 20)];
        locationImage3.image = [UIImage imageNamed:@"juli"];
        [blackView3 addSubview:locationImage3];
        
        UILabel *locationDetail3 = [[UILabel alloc] init];
        NSString *locationNum3 = @"10.6";
        NSString *location3 = @"km";
        locationDetail3.font = [UIFont systemFontOfSize:13];
        locationDetail3.text = [NSString stringWithFormat:@"%@%@",locationNum3,location3];
        CGSize location3Size = [locationDetail3.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:locationDetail3.font,NSFontAttributeName, nil]];
        CGFloat location3H = location3Size.height;
        CGFloat location3W = location3Size.width;
        locationDetail3.frame = CGRectMake(locationImage3.frame.origin.x+locationImage3.frame.size.width+4, nick3.frame.origin.y+name3H+7, location3W,location3H);
        locationDetail3.textColor = [UIColor whiteColor];
        [blackView3 addSubview:locationDetail3];
        
        UIImageView *hotImage3 = [[UIImageView alloc] initWithFrame:CGRectMake(blackView3.frame.size.width-50, 5, 20, blackView3.frame.size.height-10)];
        hotImage3.image = [UIImage imageNamed:@"hot"];
        [blackView3 addSubview:hotImage3];
        
        UILabel *hotDetail3 = [[UILabel alloc] init];
        hotDetail3.text = @"123";
        hotDetail3.font = [UIFont systemFontOfSize:12];
        CGSize hot3Size = [hotDetail3.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:hotDetail3.font,NSFontAttributeName, nil]];
        CGFloat hot3H = hot3Size.height;
        CGFloat hot3W = hot3Size.width;
        hotDetail3.textColor = [UIColor whiteColor];
        hotDetail3.frame = CGRectMake(hotImage3.frame.origin.x+hotImage3.frame.size.width, 10, hot3W, hot3H);
        [blackView3 addSubview:hotDetail3];
        
        //***手势添加***
        hot1.userInteractionEnabled = YES;
        UITapGestureRecognizer *hot1GestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotGestureRecognizer1:)];
        hot1GestureRecognizer.numberOfTapsRequired = 1;
        [hot1 addGestureRecognizer:hot1GestureRecognizer];
        
        hot2.userInteractionEnabled = YES;
        UITapGestureRecognizer *hot2GestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotGestureRecognizer2:)];
        hot2GestureRecognizer.numberOfTapsRequired = 1;
        [hot2 addGestureRecognizer:hot2GestureRecognizer];
        
        hot3.userInteractionEnabled = YES;
        UITapGestureRecognizer *hot3GestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hotGestureRecognizer3:)];
        hot3GestureRecognizer.numberOfTapsRequired = 1;
        [hot3 addGestureRecognizer:hot3GestureRecognizer];
        
        [_topTableViewHeadView addSubview:hot1];
        [_topTableViewHeadView addSubview:hot2];
        [_topTableViewHeadView addSubview:hot3];
        
    }
    return _topTableViewHeadView;
}

#pragma mark click tap 点击事件

//热度提示
-(void)rightButtonClick:(UIButton *)sender
{
    UIAlertController *hotRuleController = [UIAlertController alertControllerWithTitle:@"热度规则" message:@"热度规则：每成交一单，获取订单金额除以10的热度；每发表一篇动态，获得1热度，4小时不重复增加；动态每增加一个赞，获得1热度，动态每有1个新的用户评论，获得1热度。另每隔1天未上线，会减少5热度。如果受到投诉，会酌情减少热度" preferredStyle:UIAlertControllerStyleAlert];
    
    [hotRuleController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"＊＊＊确定＊＊＊");
    }]];
    
    [self presentViewController:hotRuleController animated:true completion:nil];
}

// **航栏按钮函数
-(void)leftButtonClick:(UIButton *)sender
{
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_topTableView cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
    NSLog(@"左");
}

-(void)hotGestureRecognizer1:(UITapGestureRecognizer*)recognizer{
    NSLog(@"＊＊＊＊排行榜1＊＊＊");
}

-(void)hotGestureRecognizer2:(UITapGestureRecognizer*)recognizer{
    NSLog(@"＊＊＊＊排行榜2＊＊＊");
}

-(void)hotGestureRecognizer3:(UITapGestureRecognizer*)recognizer{
    NSLog(@"＊＊＊＊排行榜3＊＊＊");
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
