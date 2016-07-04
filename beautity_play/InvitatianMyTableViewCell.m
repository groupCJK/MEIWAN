//
//  InvitatianMyTableViewCell.m
//  beautity_play
//
//  Created by mac on 16/7/4.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "InvitatianMyTableViewCell.h"

@implementation InvitatianMyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *timeTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 60, 10)];
        timeTitle.font = [UIFont systemFontOfSize:12.0f];
        timeTitle.text = @"邀约时间:";
        [self addSubview:timeTitle];
        self.InvitatianTime = timeTitle;
        UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(timeTitle.frame.origin.x+timeTitle.frame.size.width, 15, 60, 10)];
        time.text = @"十天前";
        time.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:time];
        self.time = time;
        
        UILabel *nameTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, timeTitle.frame.origin.y+timeTitle.frame.size.height+10, 60, 10)];
        nameTitle.font = [UIFont systemFontOfSize:12.0f];
        nameTitle.text = @"用户昵称:";
        [self addSubview:nameTitle];
        self.InvitatianName = nameTitle;
        UILabel *name = [[UILabel alloc]  initWithFrame:CGRectMake(nameTitle.frame.origin.x+nameTitle.frame.size.width, time.frame.origin.y+time.frame.size.height+10, 60, 10)];
        name.text = @"fox";
        name.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:name];
        self.time = name;
        
        UILabel *barTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, name.frame.origin.y+name.frame.size.height+10, 60, 10)];
        barTitle.text = @"约定网吧:";
        barTitle.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:barTitle];
        self.InvitatianBar = barTitle;
        UILabel *bar = [[UILabel alloc]  initWithFrame:CGRectMake(barTitle.frame.origin.x+name.frame.size.width, name.frame.origin.y+name.frame.size.height+10, 60, 10)];
        bar.text = @"暂未指定";
        bar.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:bar];
        self.time = bar;
        
        UILabel *styleTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, barTitle.frame.origin.y+barTitle.frame.size.height+10, 60, 10)];
        styleTitle.text = @"当前状态:";
        styleTitle.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:styleTitle];
        self.InvitatianStyle = styleTitle;
        UILabel *style = [[UILabel alloc]  initWithFrame:CGRectMake(styleTitle.frame.origin.x+styleTitle.frame.size.width, bar.frame.origin.y+bar.frame.size.height+10, 60, 10)];
        style.text = @"等待评价";
        style.textColor = [UIColor redColor];
        style.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:style];
        self.time = style;
        
        UILabel *invitationID = [[UILabel alloc] initWithFrame:CGRectMake(style.frame.origin.x+style.frame.size.width, bar.frame.origin.y+bar.frame.size.height+10, 40, 10)];
        invitationID.font = [UIFont systemFontOfSize:12.0f];
        invitationID.text = @"邀请ID:";
        [self addSubview:invitationID];
        self.InvitatianID = invitationID;
        UILabel *useriD = [[UILabel alloc] initWithFrame:CGRectMake(invitationID.frame.origin.x+invitationID.frame.size.width, invitationID.frame.origin.y, 60, 10)];
        useriD.text = @"100526";
        useriD.font = [UIFont systemFontOfSize:13.0f];
        [self addSubview:useriD];
        self.userID = useriD;
        
        UIImageView *promptImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width-40, (self.frame.size.height+20)/2, 30, 30)];
        promptImage.image = [UIImage imageNamed:@""];
        promptImage.backgroundColor = [UIColor blackColor];
        promptImage.layer.masksToBounds = YES;
        promptImage.layer.cornerRadius = 15.0f;
        [self addSubview:promptImage];
        self.promptImage = promptImage;
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
