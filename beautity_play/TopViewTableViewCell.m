//
//  TopViewTableViewCell.m
//  beautity_play
//
//  Created by mac on 16/6/27.
//  Copyright © 2016年 user_kevin. All rights reserved.
//

#import "TopViewTableViewCell.h"
#import "headerName.pch"

@implementation TopViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *userImage = [[UIImageView alloc]initWithFrame:CGRectMake(15, (60/2-50/2)/2+2,50, 50)];
        userImage.backgroundColor = [UIColor redColor];
        userImage.layer.cornerRadius = 25;
        userImage.layer.masksToBounds = YES;
        [self addSubview:userImage];
        self.headImage = userImage;
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(userImage.frame.origin.x+userImage.frame.size.width+20, 9, 30, 18)];
        name.text = @"昵称";
        name.font = [UIFont systemFontOfSize:14];
        [self addSubview:name];
        self.userName = name;
        
        UILabel *age = [[UILabel alloc]initWithFrame:CGRectMake(name.frame.origin.x+name.frame.size.width+4, 10, 20, 18)];
        age.text = @"23";
        age.textColor = [UIColor lightGrayColor];
        age.font = [UIFont systemFontOfSize:14];
        [self addSubview:age];
        self.userAge = age;
        
        UIImageView *sex = [[UIImageView alloc] initWithFrame:CGRectMake(age.frame.origin.x+age.frame.size.width+5, 12, 14, 14)];
        sex.image = [UIImage imageNamed:@"nvsheng_logo"];
        [self addSubview:sex];
        self.userSex = sex;
        
        UIImageView *location = [[UIImageView alloc] initWithFrame:CGRectMake(userImage.frame.origin.x+userImage.frame.size.width+20, 9+age.frame.size.height+4, 20, 25)];
        location.image = [UIImage imageNamed:@"juli"];
        [self addSubview:location];
        self.location = location;
        
        UILabel *locationNum = [[UILabel alloc] initWithFrame:CGRectMake(userImage.frame.origin.x+location.frame.size.width+userImage.frame.size.width+20,location.frame.size.height+6, 60, 25)];
        locationNum.text = @"8公里";
        locationNum.font = [UIFont systemFontOfSize:14];
        locationNum.textColor = [UIColor lightGrayColor];
        [self addSubview:locationNum];
        self.locationNumber = locationNum;
        
        UIImageView *hotImage = [[UIImageView alloc] init];
        hotImage.image = [UIImage imageNamed:@"hot"];
        hotImage.frame = CGRectMake(self.frame.size.width-45, (60/2-36/2)/2+4, 20, 36);
        [self addSubview:hotImage];
        self.hotImage = hotImage;
        
        UILabel *hotNumber = [[UILabel alloc] initWithFrame:CGRectMake(hotImage.frame.origin.x+hotImage.frame.size.width+1, 6, 20, 18)];
        hotNumber.text = @"12";
        hotNumber.textColor = [UIColor lightGrayColor];
        hotNumber.font = [UIFont systemFontOfSize:12];
        [self addSubview:hotNumber];
        self.hotNumber = hotNumber;
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
