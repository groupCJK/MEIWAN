//
//  pushAndDismissView.m
//  beautity_play
//
//  Created by user_kevin on 16/6/30.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "pushAndDismissView.h"

#import "publicHeader.h"

@implementation pushAndDismissView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = NavColor;
        
        UIImageView * imageview = [[UIImageView alloc]init];
        imageview.image = [UIImage imageNamed:@"back"];
        imageview.center = CGPointMake(12+3.5, frame.size.height/2);
        imageview.bounds = CGRectMake(0, 0, 7, 13);
        [self addSubview:imageview];
        UILabel * backTitle = [[UILabel alloc]init];
        backTitle.text = @"返回";
        backTitle.textColor = [UIColor whiteColor];
        backTitle.font =  Font(15.0);
        CGSize size = [backTitle.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:backTitle.font,NSFontAttributeName, nil]];
        backTitle.center = CGPointMake(imageview.frame.size.width+imageview.frame.origin.x + 2 + size.width/2,frame.size.height/2);
        backTitle.bounds = CGRectMake(0, 0, size.width, size.height);
        [self addSubview:backTitle];
        
        UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
        backButton.frame = CGRectMake(0, 0, 40, frame.size.height);
        [self addSubview:backButton];
        
        UIButton * finished = [UIButton buttonWithType:UIButtonTypeCustom];
        [finished setTitle:@"完成" forState:UIControlStateNormal];
        finished.titleLabel.font = Font(15.0);
        finished.frame = CGRectMake(width_screen-12-40, 0, 40, frame.size.height);
        [finished addTarget:self action:@selector(finishedClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:finished];
        self.finished = finished;
        
        UILabel * label = [[UILabel alloc]init];
        label.font = Font(18.0);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = CGRectMake(80, 0, frame.size.width-160, frame.size.height);
        [self addSubview:label];
        self.titleLabel = label;
    }
    return self;
}
- (void)backClick:(UIButton *)sender
{
    [self.delegate backPoPView:sender];
}
- (void)finishedClick:(UIButton *)sender
{
    [self.delegate finishClick:sender];
}
@end
