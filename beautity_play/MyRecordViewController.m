//
//  MyRecordViewController.m
//  beautity_play
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "MyRecordViewController.h"
#import "InvitatianMyTableViewCell.h"

@interface MyRecordViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *invitatianTableView;

@end

@implementation MyRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self invitatianTableView];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InvitatianMyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[InvitatianMyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (UITableView *)invitatianTableView{
    if (!_invitatianTableView) {
        _invitatianTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width_screen, self.view.frame.size.height) style:UITableViewStylePlain];
        _invitatianTableView.delegate = self;
        _invitatianTableView.dataSource = self;
        _invitatianTableView.tableFooterView = [UIView new];
        [self.view addSubview:_invitatianTableView];
    }
    return _invitatianTableView;
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
