//
//  RecordCenterViewController.m
//  beautity_play
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "RecordCenterViewController.h"
#import "MyRecordViewController.h"
#import "InvitatianMyViewController.h"
#import "CAPSPageMenu.h"

@interface RecordCenterViewController ()<pushAndDismissViewDelegate,CAPSPageMenuDelegate>
{
    CAPSPageMenu *pageMenu;
}

@property (nonatomic, strong)UIView *blackView;

@end

@implementation RecordCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, width_screen, height_screen-44)];
    _blackView.backgroundColor = [UIColor whiteColor];
    
    pushAndDismissView * naview = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 44)];
    naview.delegate = self;
    naview.titleLabel.text = @"纪录中心";
    naview.finished.hidden = YES;
    [self.view addSubview:_blackView];
    [self.view addSubview:naview];
    
    NSMutableArray *contrllerArray = [NSMutableArray array];
    
    MyRecordViewController *myRecordViewController = [MyRecordViewController new];
    myRecordViewController.title = @"我的记录";
    
    InvitatianMyViewController *invitatianMyViewController = [InvitatianMyViewController new];
    invitatianMyViewController.title = @"我的邀约";
    [contrllerArray addObject:myRecordViewController];
    [contrllerArray addObject:invitatianMyViewController];
    NSDictionary *parameters = @{CAPSPageMenuOptionMenuItemWidth:@(width_screen/2),
                                 CAPSPageMenuOptionMenuMargin:@(0),
                                 CAPSPageMenuOptionUseMenuLikeSegmentedControl:@(NO),
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor:NavColor,
                                 CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor whiteColor],
                                 CAPSPageMenuOptionSelectionIndicatorColor:NavColor,
                                 CAPSPageMenuOptionBottomMenuHairlineColor :[UIColor purpleColor],
                                 CAPSPageMenuOptionMenuItemSeparatorRoundEdges:@(YES)};

    pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:contrllerArray frame:CGRectMake(0, 0, _blackView.frame.size.width, _blackView.frame.size.height) options:parameters];
    pageMenu.delegate = self;
    [_blackView addSubview:pageMenu.view];
    [self addChildViewController:pageMenu];
    
    // Do any additional setup after loading the view.
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
