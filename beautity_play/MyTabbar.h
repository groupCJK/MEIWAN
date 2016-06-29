//
//  MyTabbar.h
//  tabBarTEST
//
//  Created by 张雄 on 15/12/24.
//  Copyright © 2015年 八骏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabbar : UITabBarController

@property(nonatomic,strong)UIView * tabView;

@property(nonatomic,strong)UIView * realTabView;

@property(nonatomic,assign)UIButton * select;

@property(nonatomic,strong)UILabel * countLable;


@end
