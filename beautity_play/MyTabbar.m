//
//  MyTabbar.m
//  tabBarTEST
//
//  Created by 张雄 on 15/12/24.
//  Copyright © 2015年 八骏. All rights reserved.
//

#import "MyTabbar.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface MyTabbar ()

@property(nonatomic,strong)UIButton * firstBtn;

@end

@implementation MyTabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
    
    self.select = 0;
    
    UIImageView * tabView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
    tabView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    self.realTabView = tabView;
}
    
@end
