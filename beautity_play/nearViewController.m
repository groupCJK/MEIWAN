//
//  nearViewController.m
//  text
//
//  Created by user_kevin on 16/6/23.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "nearViewController.h"
#import "CJKNavigationView.h"
#import "headerName.pch"
#import "publicHeader.h"
#import "PlayerInfoViewController.h"

@interface nearViewController ()<CJKNavigationViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateWaterfallLayout,UICollectionViewDataSource,firstPage_scrollViewCellDelegate,searchViewDelegate>
{
    UICollectionViewWaterfallLayout * _layout;
    UICollectionView * _collectionView;
    UITableView * _tableview;
}
@end

@implementation nearViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, width_screen, height_screen)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [self creat_navigationView];
    [self tableView_creat];
    // Do any additional setup after loading the view.
}

#pragma mark----创建区
-(void)tableView_creat
{
    _tableview  =[[UITableView alloc]initWithFrame:CGRectMake(0, 55, width_screen, height_screen-55-40) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.backgroundColor = baseColor;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
}
- (void)creat_navigationView
{
    CJKNavigationView * baseView = [[CJKNavigationView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 35)];
    baseView.delegate = self;
    baseView.titleLabel.text = @"首页";
    [baseView.leftButton setBackgroundImage:[UIImage imageNamed:@"list_2"] forState:UIControlStateNormal];
    [baseView.rightButton setBackgroundImage:[UIImage imageNamed:@"shouye-sousuo"] forState:UIControlStateNormal];
    [self.view addSubview:baseView];
}

#pragma mark----tableview代理区
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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
    
    if (indexPath.section==0) {
        firstPage_scrollViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[firstPage_scrollViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        return cell;
        
    }else{
        
        UITableViewCell * tableviewcell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!tableviewcell) {
            tableviewcell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            _layout = [[UICollectionViewWaterfallLayout alloc]init];
            _layout.columnCount = 2;//设置两列
            _layout.itemWidth = ([UIScreen mainScreen].bounds.size.width-5)/2;//设置每个item的宽
            _layout.delegate = self;//通过代理设置item的高
            _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//设置区和四周边界的距离
            
            _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:_layout];
            _collectionView.delegate = self;
            _collectionView.dataSource = self;
            _collectionView.backgroundColor = _tableview.backgroundColor;
            _collectionView.scrollEnabled = NO;//禁止collection的滑动
            [_collectionView registerClass:[CJKCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
            [tableviewcell.contentView addSubview:_collectionView];
            
            [_collectionView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
            
        }
        tableviewcell.selectionStyle = UITableViewCellSelectionStyleNone;
        return tableviewcell;
        
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 90;
    }else{
        return _collectionView.contentSize.height+1;
    }
}
#pragma mark----collectionView代理区
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    CGSize size = [change[@"new"] CGSizeValue];
    //修改 CollectionView 的高度为显示区域的高度。
    CGRect frame = _collectionView.frame;
    frame.size.height = size.height;
    _collectionView.frame = frame;
    
    [_tableview reloadData];
}
- (void)dealloc
{
    [_collectionView removeObserver:self forKeyPath:@"contentSize"];
}
#pragma mark----collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell* )collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CJKCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerInfoViewController *plaerInfoCtr = [[PlayerInfoViewController alloc] init];
    plaerInfoCtr.title = @"Ta的资料";
    [self presentViewController:plaerInfoCtr animated:YES completion:nil];

    NSLog(@"瀑布流 选择第%ld个",(long)indexPath.item);
}
#pragma mark - UICollectionViewDelegateWaterfallLayout

//返回每个 item 的高度。
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewWaterfallLayout *)collectionViewLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}


#pragma mark----自定义代理区-导航栏按钮
-(void)leftButtonClick:(UIButton *)sender
{
    NSLog(@"左");
    
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_tableview cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"动画结束%d",flag);
}
-(void)rightButtonClick:(UIButton *)sender
{
    NSLog(@"右");
    searchView * searchview  = [[searchView alloc]initWithFrame:CGRectMake(0, 0, width_screen, height_screen)];
    searchview.delegate = self;
    [self.view addSubview:searchview];
    
}
#pragma mark----自定义代理区条件搜索代理
-(void)sexChooseButtonClick:(UIButton *)sender
{
    NSLog(@"性别选择%@",sender.titleLabel.text);
}
-(void)priceChooseButtonClick:(UIButton *)sender
{
    NSLog(@"价格选择%@",sender.titleLabel.text);
}
#pragma mark----自定义代理区滑动视图上图片点击事件
-(void)scrollImageViewClick:(UIGestureRecognizer *)gesture
{
    NSLog(@"%@",gesture.view);
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
