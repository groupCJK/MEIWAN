//
//  getNumberViewController.m
//  beautity_play
//
//  Created by user_kevin on 16/7/1.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "getNumberViewController.h"

@implementation getNumberViewController

-(void)viewDidLoad
{
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
   NSDictionary * dic = [[NSDictionary alloc]initWithDictionary: [userdefaults objectForKey:@"registerAccount"]];
    NSLog(@"%@",dic);
    [userdefaults synchronize];
    pushAndDismissView * topView = [[pushAndDismissView alloc]initWithFrame:CGRectMake(0, 20, width_screen, 40)];
    [self.view addSubview:topView];
}

@end
